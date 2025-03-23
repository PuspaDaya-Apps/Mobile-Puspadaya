import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/RiwayatAnak/detail/model/get_grafik_kms_model.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/chart_kmb.dart';
import '../cubit/select_chart_cubit.dart';
import '../model/get_detail_anak_response.dart' as GetDetailAnakResponse;

class DetailDataKIA extends StatelessWidget {
  final GetDetailAnakResponse.GetDetailAnakResponse detailResponse;
  final List<GetGrafikKmsModel> dataGrafik;
  const DetailDataKIA({super.key, required this.detailResponse, required this.dataGrafik});

  @override
  Widget build(BuildContext context) {
    // logger.d('data pengukuran : ${detailResponse.data!.pengukuranAnak![0].tinggiBadan}');
    return BlocProvider(
      create: (context) => SelectChartCubit(),
      child: DetailDataKIAView(detailResponse: detailResponse, dataGrafik: dataGrafik,),
    );
  }
}

class DetailDataKIAView extends StatefulWidget {
  final List<GetGrafikKmsModel> dataGrafik;
   final GetDetailAnakResponse.GetDetailAnakResponse detailResponse;
  const DetailDataKIAView({super.key, required this.detailResponse, required this.dataGrafik});

  @override
  State<DetailDataKIAView> createState() => _DetailDataKIAViewState();
}

class _DetailDataKIAViewState extends State<DetailDataKIAView> {
  bool _isExpanded = false;

  int selectedIndex = 0;

  List<String> selectWaktu = [
    '0 bulan - 24 bulan',
    '2 tahun - 5 tahun',
  ];
  String selectedWaktu = "0 bulan - 24 bulan";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // switch widget yang digunakan untuk switch antara grafik Tinggi dan Berat
          SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: selectedIndex,
              thumbColor: bluePrimaryMain,
              children: {
                0: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Tinggi",
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.black)),
                ),
                1: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Berat",
                      style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.black)),
                ),
              },
              onValueChanged: (int? index) {
                setState(() {
                  selectedIndex = index!;
                });
                context.read<SelectChartCubit>().selectChart(
                      widget.detailResponse.data!.jenisKelamin ?? '',
                      selectedIndex,
                      selectedWaktu == '0 bulan - 24 bulan' ? '0-24' : '2-5',
                      widget.dataGrafik,
                    );
                // widget.onToggle(selectedIndex == 0);
              },
            ),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            style: AppTextStyles.primaryTextNormal.copyWith(fontSize: 12),
            value: selectedWaktu,
            hint: Text(
              "Waktu",
              style: AppTextStyles.secoundaryTextNormal.copyWith(fontSize: 12),
            ),
            buttonStyleData: const ButtonStyleData(elevation: 0),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: backgroundWhite10,
              ),
              elevation: 0,
            ),
            items: selectWaktu.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedWaktu = value!; // Simpan nilai yang dipilih
              });
              context.read<SelectChartCubit>().selectChart(
                    widget.detailResponse.data!.jenisKelamin ?? '',
                    selectedIndex,
                    selectedWaktu == '0 bulan - 24 bulan' ? '0-24' : '2-5',
                    widget.dataGrafik,
                  );
            },
            onSaved: (value) {
              selectedWaktu = value!;
            },
            validator: (value) =>
                value == null ? "Pilih waktu terlebih dahulu" : null,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: "Waktu",
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
              filled: true,
              fillColor: backgroundWhite10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: redPrimaryMain),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
          Text(
            'KMS Perkembangan Anak ${selectedIndex == 0 ? "Tinggi" : "Berat"} Anak',
            style: AppTextStyles.primaryTextMedium.copyWith(
              fontSize: 12,
            ),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(16)),

          // grafik
          BlocBuilder<SelectChartCubit, SelectChartState>(
            builder: (context, state) {
              if (state is SelectChartLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SelectChartFailed) {
                return Center(child: Text(state.message));
              } else if (state is SelectChartSuccess) {
                return ChartPage(data: state.data);
              }
              return Container();
            },
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black54,
          ),
          SizedBox(
            height: 16,
          ),
          Text('Riwayat Pengukuran'),
          RiwayatPengukuranDataKIA(data: widget.detailResponse.data?.pengukuranAnak??[],),
        ],
      ),
    );
  }
}

class RiwayatPengukuranDataKIA extends StatelessWidget {
  List<GetDetailAnakResponse.Pengukuran> data;
  RiwayatPengukuranDataKIA({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.68,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 960,
        columns: [
          DataColumn2(
            size: ColumnSize.S,
            fixedWidth: 32,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('No'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            fixedWidth: 100,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tanggal'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('BB(Kg)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TB(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Lila(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TP(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            fixedWidth: 200,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Petugas'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Stunting'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Under weight'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Wasting'),
            ),
            numeric: true,
          ),
        ],
        rows: List.generate(
          data.length,
          (index) {
            final e = data[index];
            return DataRow(cells: [
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${index + 1}'))),
              DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  e.tanggalPengukuran != null
                      ? DateFormat('dd-MM-yyyy').format(DateTime.parse(e.tanggalPengukuran!))
                      : '-',
                ),
              )),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.beratBadan.toString() ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.tinggiBadan.toString() ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.lingkarLenganAtas.toString() ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.lingkarKepala.toString() ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.namaKader?.toString() ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.statusStunting ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.statusGizi ?? '-'))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text(e.statusGizi ?? '-'))),
            ]);
          },
        ),
      ),
    );
  }
}
