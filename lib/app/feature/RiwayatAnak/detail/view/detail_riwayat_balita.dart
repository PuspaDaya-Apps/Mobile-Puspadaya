import 'package:data_table_2/data_table_2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../monitoring/model/riwayat_monitoring_anak_model.dart';
import '../bloc/detail_riwayat_pengukuran_anak_bloc.dart';

class DetailRiwayatBalita extends StatelessWidget {
  final String id;
  const DetailRiwayatBalita({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailRiwayatPengukuranAnakBloc(),
      child: DetailRiwayatBalitaView(
        id: id,
      ),
    );
  }
}

class DetailRiwayatBalitaView extends StatefulWidget {
  final String id;
  const DetailRiwayatBalitaView({super.key, required this.id});

  @override
  State<DetailRiwayatBalitaView> createState() =>
      _DetailRiwayatBalitaViewState();
}

class _DetailRiwayatBalitaViewState extends State<DetailRiwayatBalitaView> {
  bool _isExpanded = false;

  @override
  void initState() {
    context
        .read<DetailRiwayatPengukuranAnakBloc>()
        .add(GetDetailRiwayatPengukuranAnak(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Riwayat Anak',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocBuilder<DetailRiwayatPengukuranAnakBloc,
            DetailRiwayatPengukuranAnakState>(
          builder: (context, state) {
            if (state is DetailRiwayatPengukuranAnakLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailRiwayatPengukuranAnakFailed) {
              return Center(child: Text(state.message));
            }
            if (state is DetailRiwayatPengukuranAnakSuccess) {
              return SingleChildScrollView(
                child: Container(
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
                            ? sizeHeighofSingleForm * 3.7
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
                              InfoFieldWidget(
                                  text: state.data.data.nik),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nama',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: state.data.data.namaAnak),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Umur',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text:
                                      '${HelperData().countYearFromDateTime(state.data.data.tanggalLahir)} Tahun ${HelperData().countMonthFromDateTime(state.data.data.tanggalLahir)} Bulan'),
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
                                      'Posyandu',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: state.data.data.posyandu.namaPosyandu),
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
                                        text: state.data.data.kartuKeluarga.nomorKartuKeluarga),
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
                                        text: state.data.data.orangTua.ayah.namaAyah),
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
                                        text: state.data.data.orangTua.ibu.namaIbu),
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
                                              text: state.data.data.dusun
                                                  .desaKelurahan
                                                  .kecamatan
                                                  .kabupatenKota
                                                  .provinsi
                                                  .namaProvinsi),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.
                                                  data
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
                                              text: state.data.data
                                                  .dusun
                                                  .desaKelurahan
                                                  .kecamatan
                                                  .namaKecamatan),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.data.dusun.desaKelurahan.namaDesaKelurahan),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    InfoFieldWidget(
                                        text: state.data.data.dusun.namaDusun),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.data.rt),
                                        ),
                                        Expanded(
                                          child: InfoFieldWidget(
                                              text: state.data.data.rw),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8),
                                    ),
                                    InfoFieldWidget(
                                      text:
                                          state.data.data.alamat,
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
                      Image(image: AssetImage(imageGrafikPerkembanganAnak)),
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
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      DataTableRiwayatAnak()
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class DataTableRiwayatAnak extends StatelessWidget {
  const DataTableRiwayatAnak({super.key});

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
        rows: [
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-24'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('30'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('95'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('15'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('28'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Nita Ardhi'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Kurang'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-20'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('28'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('92'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('14'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('27'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Febi Wahyuni'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Sangat Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Buruk'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('sangat kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('3'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-15'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('32'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('100'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('17'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('30'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Frisca Aurealia'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Pendek'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Normal'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('normal'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('4'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-10'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('27'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('90'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('26'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Siska Ardina'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Sangat Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Kurang'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('kurus'))),
          ]),
        ],
      ),
    );
  }
}
