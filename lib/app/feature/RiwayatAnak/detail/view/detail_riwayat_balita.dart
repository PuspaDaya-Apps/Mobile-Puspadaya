import 'package:data_table_2/data_table_2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../monitoring/model/riwayat_monitoring_anak_model.dart';

class DetailRiwayatBalita extends StatelessWidget {
  final RiwayatMonitoringAnakModel detailRiwayatAnak;
  const DetailRiwayatBalita({super.key, required this.detailRiwayatAnak});

  @override
  Widget build(BuildContext context) {
    return DetailRiwayatBalitaView(
      detailRiwayatAnak: detailRiwayatAnak,
    );
  }
}

class DetailRiwayatBalitaView extends StatefulWidget {
  final RiwayatMonitoringAnakModel detailRiwayatAnak;
  const DetailRiwayatBalitaView({super.key, required this.detailRiwayatAnak});

  @override
  State<DetailRiwayatBalitaView> createState() =>
      _DetailRiwayatBalitaViewState();
}

class _DetailRiwayatBalitaViewState extends State<DetailRiwayatBalitaView> {
  bool _isExpanded = false;

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
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text: '${widget.detailRiwayatAnak.data.nik}'),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Nama',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text: widget.detailRiwayatAnak.data.namaAnak),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Umur',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text:
                                '${HelperData().countYearFromDateTime(widget.detailRiwayatAnak.data.tanggalLahir)} Tahun ${HelperData().countMonthFromDateTime(widget.detailRiwayatAnak.data.tanggalLahir)} Bulan'),
                        Visibility(
                          visible: _isExpanded,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Posyandu',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget.detailRiwayatAnak.data.posyandu
                                      .namaPosyandu),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nomor Kartu Keluarga',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget.detailRiwayatAnak.data
                                      .kartuKeluarga.nomorKartuKeluarga),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              const Text(
                                'Nama Ayah',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget.detailRiwayatAnak.data.orangTua
                                      .ayah.namaAyah),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nama Ibu',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget.detailRiwayatAnak.data.orangTua
                                      .ibu.namaIbu),
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
                                        text: widget
                                            .detailRiwayatAnak
                                            .data
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .kabupaten
                                            .provinsi
                                            .nama),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailRiwayatAnak
                                            .data
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .kabupaten
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
                                        text: widget
                                            .detailRiwayatAnak
                                            .data
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .nama),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget.detailRiwayatAnak.data
                                            .dusun.desaKelurahan.nama),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(
                                  text:
                                      widget.detailRiwayatAnak.data.dusun.nama),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget.detailRiwayatAnak.data.rt),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget.detailRiwayatAnak.data.rw),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(
                                text: widget.detailRiwayatAnak.data.alamat,
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
