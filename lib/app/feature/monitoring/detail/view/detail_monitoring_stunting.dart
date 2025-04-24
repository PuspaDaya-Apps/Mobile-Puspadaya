import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../../config/screen_config/size_config.dart';
import '../../../../../../config/theme/text_style.dart';
import '../../../../view/widget/chart_kmb.dart';
import '../../../../view/widget/info_field_widget.dart';
// import '../../model/get_detail_monitoring_anak.dart'
//     as GetDetailRiwayatPengukuranAnakModel;
import '../../../../view/widget/nullable_utils_table.dart';
import '../../model/get_detail_monitoring_anak.dart' as GetDetailMonitoringAnak;
import '../bloc/detail_data_stunting_bloc.dart';
import '../cubit/select_chart_cubit.dart';

class DetailMonitoringStunting extends StatelessWidget {
  final String id;
  const DetailMonitoringStunting({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailDataStuntingBloc(),
        ),
        BlocProvider(
          create: (context) => SelectChartCubit(),
        ),
      ],
      child: DetailMonitoringStuntingView(
        id: id,
      ),
    );
  }
}

class DetailMonitoringStuntingView extends StatefulWidget {
  final String id;
  const DetailMonitoringStuntingView({super.key, required this.id});

  @override
  State<DetailMonitoringStuntingView> createState() =>
      _DetailMonitoringStuntingViewState();
}

class _DetailMonitoringStuntingViewState
    extends State<DetailMonitoringStuntingView> {
  @override
  void initState() {
    context
        .read<DetailDataStuntingBloc>()
        .add(FetchDetailDataStunting(id: widget.id));
    super.initState();
  }

  bool _isExpanded = false;
  int selectedIndex = 0;
  List<String> selectWaktu = [
    '0 bulan - 24 bulan',
    '2 tahun - 5 tahun',
  ];
  String selectedWaktu = "0 bulan - 24 bulan";

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 2.9;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Monitoring Stunting',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<DetailDataStuntingBloc, DetailDataStuntingState>(
            builder: (context, state) {
              if (state is DetailDataStuntingLoading) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: 50.0,
                    ),
                  ),
                );
              }
              if (state is DetailDataStuntingFailed) {
                return Center(
                  child: Text('Gagal Mendapatkan Data ${state.message}'),
                );
              }
              if (state is DetailDataStuntingSuccess) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: _isExpanded
                            ? sizeHeighofSingleForm * 3.2
                            : sizeHeighofSingleForm,
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'NIK',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: state.data.data.nik),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nama',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: state.data.data.namaAnak),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Status Stunting',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        InfoFieldWidget(
                                          text: state.data.data.statusStunting,
                                          color: redPrimaryMain,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Umur',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        InfoFieldWidget(
                                            text: state.data.data.usia),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: _isExpanded,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16)),
                                    const Text(
                                      'Nomor Kartu Keluarga',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: state.data.data.kartuKeluarga
                                            .nomorKartuKeluarga),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    const Text(
                                      'Nama Ayah',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: state.data.data.ayah.nama),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16)),
                                    const Text(
                                      'Nama Ibu',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: state.data.data.ibu.nama),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    const Text(
                                      textAlign: TextAlign.start,
                                      'Alamat',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state
                                                  .data
                                                  .data
                                                  .ibu
                                                  .dusun
                                                  .desaKelurahan
                                                  .kecamatan
                                                  .kabupatenKota
                                                  .provinsi
                                                  .namaProvinsi),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state
                                                  .data
                                                  .data
                                                  .ibu
                                                  .dusun
                                                  .desaKelurahan
                                                  .kecamatan
                                                  .kabupatenKota
                                                  .namaKabupatenKota),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state
                                                  .data
                                                  .data
                                                  .ibu
                                                  .dusun
                                                  .desaKelurahan
                                                  .kecamatan
                                                  .namaKecamatan),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state
                                                  .data
                                                  .data
                                                  .ibu
                                                  .dusun
                                                  .desaKelurahan
                                                  .namaDesaKelurahan),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    InfoFieldWidget(
                                        text: state
                                            .data.data.ibu.dusun.namaDusun),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.data.ibu.rt),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.data.ibu.rw),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    InfoFieldWidget(
                                      text: state.data.data.ibu.alamatLengkap,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Detail Anak',
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                size: 20,
                                _isExpanded
                                    ? FluentIcons.chevron_up_20_filled
                                    : FluentIcons.chevron_down_20_filled,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.black54,
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
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
                                  state.data.data.jenisKelamin,
                                  selectedIndex,
                                  selectedWaktu == '0 bulan - 24 bulan'
                                      ? '0-24'
                                      : '2-5',
                                  state.dataGrafik,
                                );
                            // widget.onToggle(selectedIndex == 0);
                          },
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        style: AppTextStyles.primaryTextNormal
                            .copyWith(fontSize: 12),
                        value: selectedWaktu,
                        hint: Text(
                          "Waktu",
                          style: AppTextStyles.secoundaryTextNormal
                              .copyWith(fontSize: 12),
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
                                state.data.data.jenisKelamin,
                                selectedIndex,
                                selectedWaktu == '0 bulan - 24 bulan'
                                    ? '0-24'
                                    : '2-5',
                                state.dataGrafik,
                              );
                        },
                        onSaved: (value) {
                          selectedWaktu = value!;
                        },
                        validator: (value) => value == null
                            ? "Pilih waktu terlebih dahulu"
                            : null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          hintText: "Waktu",
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: redPrimaryMain),
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
                            return SizedBox(
                              child: Center(
                                child: SpinKitThreeBounce(
                                  color: bluePrimaryMain,
                                  size: 50.0,
                                ),
                              ),
                            );
                          } else if (state is SelectChartFailed) {
                            return Center(child: Text(state.message));
                          } else if (state is SelectChartSuccess) {
                            return ChartPage(data: state.data);
                          }
                          return Container();
                        },
                      ),
                      // grafik

                      // Image(image: AssetImage(imageGrafikPerkembanganAnak)),
                      SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.black54,
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Riwayat Pengukuran',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      DataTableRiwayatPengukuranStunting(
                        data: state.data.data.pengukuran!,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class DataTableRiwayatPengukuranStunting extends StatelessWidget {
  final List<GetDetailMonitoringAnak.Pengukuran> data;
  const DataTableRiwayatPengukuranStunting({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.68,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1200,
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
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('BB(Kg)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TB(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Lila(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
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
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Stunting'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Underweight'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
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
                child: NullableUtilsTable(
                      value:
                          DateFormat('dd-MM-yyyy').format(e.tanggalPengukuran)),
              )),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.beratBadan))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.tinggiBadan))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.lingkarLenganAtas))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.lingkarKepala))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.namaKader?.toString()))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.statusStunting))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.statusGizi))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.statusGizi))),
            ]);
          },
        ),
      ),
    );
  }
}
