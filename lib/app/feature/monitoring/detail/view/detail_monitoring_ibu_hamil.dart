import 'package:data_table_2/data_table_2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../../config/screen_config/size_config.dart';
import '../../../../../../config/theme/text_style.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../model/get_detail_monitoring_ibu_hamil.dart';
import '../bloc/detail_data_ibu_hamil_bloc.dart';

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
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 2.9;
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
              return const Center(
                child: CircularProgressIndicator(),
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
                    DataTableRiwayatPengukuranIbuHamil(),
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
  const DataTableRiwayatPengukuranIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.68,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 900,
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
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TB(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('BB(Kg)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Lila(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TFU(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('HB(g/dl)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TAK'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tablet FE'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            fixedWidth: 200,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Petugas'),
            ),
            numeric: true,
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-11-24'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('4 bulan'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('167'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('62'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('34'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('18'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('14'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Michelle Susanti'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-11-10'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('3 bulan 2 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('166'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('60'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('33'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('17'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('13.5'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Febi Wahyuni'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('3'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-10-27'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('3 bulan'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('165'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('58'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('32'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('16'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Gasti Widiastuti'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('4'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-10-13'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('2 bulan 2 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('164'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('56'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('31'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('15'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('12.5'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Maida Rahmawati'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('5'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-09-29'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('2 bulan'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('163'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('54'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('30'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('14'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('12'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Tidak'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Mila Nurdiyanti'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('6'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-09-15'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('1 bulan 3 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('162'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('52'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('29'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('11.5'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Tidak'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Kania Nasyiah'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('7'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-09-01'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('1 bulan 1 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('160'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('50'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('28'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('12'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('11'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Tidak'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Nova Puspasari'))),
          ]),
        ],
      ),
    );
  }
}
