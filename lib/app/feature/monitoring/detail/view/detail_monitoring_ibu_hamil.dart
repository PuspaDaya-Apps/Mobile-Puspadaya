import 'package:data_table_2/data_table_2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../../config/screen_config/size_config.dart';
import '../../../../../../config/theme/text_style.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/nullable_utils_table.dart';
import '../bloc/detail_data_ibu_hamil_bloc.dart';
import '../../model/get_detail_monitoring_ibu_hamil.dart'
    as GetDetailMonitoringIbuHamil;

class DetailMonitoringIbuHamil extends StatelessWidget {
  final String id;
  const DetailMonitoringIbuHamil({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailDataIbuHamilBloc(),
      child: DetailMonitoringIbuHamilView(
        id: id,
      ),
    );
  }
}

class DetailMonitoringIbuHamilView extends StatefulWidget {
  final String id;
  const DetailMonitoringIbuHamilView({super.key, required this.id});

  @override
  State<DetailMonitoringIbuHamilView> createState() =>
      _DetailMonitoringIbuHamilViewState();
}

class _DetailMonitoringIbuHamilViewState
    extends State<DetailMonitoringIbuHamilView> {
  bool _isExpanded = false;

  @override
  void initState() {
    context
        .read<DetailDataIbuHamilBloc>()
        .add(FetchDetailDataIbuHamil(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 3.4;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Monitoring Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<DetailDataIbuHamilBloc, DetailDataIbuHamilState>(
              builder: (context, state) {
            if (state is DetailDataIBuHamilLoading) {
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
            } else if (state is DetailDataIbuHamilFailed) {
              return Center(
                child: Text('Gagal memuat data ${state.message}'),
              );
            } else if (state is DetailDataIbuHamilSuccess) {
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
                          ? sizeHeighofSingleForm * 2.9
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
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(text: state.data.data.ibuAnak.nik),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            const Text(
                              'Nama',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(text: state.data.data.ibuAnak.nama),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            const Text(
                              'Usia Kandungan',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(
                                text: state.data.data.usiaKehamilan),
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
                                      text: state.data.data.ibuAnak
                                          .kartuKeluarga.nomorKk),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  const Text(
                                    'Nama Suami',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  InfoFieldWidget(
                                      text: state.data.data.ibuAnak.ayah.nama),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
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
                                                .ibuAnak
                                                .dusun
                                                .desaKelurahan
                                                .kecamatan
                                                .kabupatenKota
                                                .provinsi
                                                .nama),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state
                                                .data
                                                .data
                                                .ibuAnak
                                                .dusun
                                                .desaKelurahan
                                                .kecamatan
                                                .kabupatenKota
                                                .nama),
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
                                            text: state.data.data.ibuAnak.dusun
                                                .desaKelurahan.kecamatan.nama),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data.data.ibuAnak.dusun
                                                .desaKelurahan.nama),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  InfoFieldWidget(
                                      text: state.data.data.ibuAnak.dusun.nama),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data.data.ibuAnak.rt),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data.data.ibuAnak.rw),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  InfoFieldWidget(
                                    text: state.data.data.ibuAnak.alamat,
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
                              'Detail Ibu Hamil',
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
                    Text(
                      'Riwayat Pengukuran',
                      style: AppTextStyles.primaryTextMedium.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    DataTableRiwayatPengukuranIbuHamil(
                        tanggalAwalHaid: DateTime.parse(state.data.data.tanggalPertamaHaid),
                      data: state.data.data.pengukuranIbuHamil,
                    ),
                  ],
                ),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}

class DataTableRiwayatPengukuranIbuHamil extends StatelessWidget {
  DateTime tanggalAwalHaid;
  List<GetDetailMonitoringIbuHamil.PengukuranIbuHamil> data;
  DataTableRiwayatPengukuranIbuHamil(
      {super.key, required this.data, required this.tanggalAwalHaid});

  // Fungsi untuk menghitung usia kehamilan
  String hitungUsiaKehamilan(DateTime tanggalPengukuran) {
    final selisihHari = tanggalPengukuran.difference(tanggalAwalHaid).inDays;
    final usiaMinggu = selisihHari ~/ 7;
    final bulan = usiaMinggu ~/ 4;
    final minggu = usiaMinggu % 4;
    return "$bulan bulan $minggu minggu";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height / 1.68,
      child: DataTable2(
        empty: const Center(
          child: Text('Tidak ada data pengukuran'),
        ),
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1200,
        columns: [
          DataColumn2(
            size: ColumnSize.S,
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
            fixedWidth: 170,
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Usia Kehamilan'),
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
              child: Text('BB(Kg)'),
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
              child: Text('TFU(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('HB(g/dl)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TAK'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tablet FE'),
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
        ],
        rows: List.generate(
          data.length,
          (index) {
            final e = data[index];
            return DataRow(cells: [
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${index + 1}'))),
              DataCell(
                Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(
                      value: e.tanggalPengukuran != null
                          ? DateFormat('dd-MM-yyyy')
                              .format(e.tanggalPengukuran!)
                          : null),
                ),
              ),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(
                      value: e.tanggalPengukuran != null
                          ? hitungUsiaKehamilan(e.tanggalPengukuran!)
                          : null))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.tinggiBadan))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.beratBadan))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.lingkarLenganAtas))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.tinggiFundusUteri))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.hemoglobin))),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.terpaparAsapRokok))),
              DataCell(
                Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(
                    value: (e.jumlahTabletFe ?? 0) > 0
                        ? e.jumlahTabletFe.toString()
                        : null,
                  ),
                ),
              ),
              DataCell(Align(
                  alignment: Alignment.centerLeft,
                  child: NullableUtilsTable(value: e.kader.nama))),
            ]);
          },
        ),
      ),
    );
  }
}
