import 'package:data_table_2/data_table_2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../bloc/detail_riwayat_pengukuran_ibu_hamil_bloc.dart';

class DetailRiwayatIbuHamil extends StatelessWidget {
  final String id;

  const DetailRiwayatIbuHamil({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailRiwayatPengukuranIbuHamilBloc(),
      child: DetailRiwayatIbuHamilView(
        id: id,
      ),
    );
  }
}

class DetailRiwayatIbuHamilView extends StatefulWidget {
  final String id;

  const DetailRiwayatIbuHamilView({super.key, required this.id});

  @override
  State<DetailRiwayatIbuHamilView> createState() =>
      _DetailRiwayatIbuHamilViewState();
}

class _DetailRiwayatIbuHamilViewState extends State<DetailRiwayatIbuHamilView> {
  bool _isExpanded = false;

  @override
  void initState() {
    context.read<DetailRiwayatPengukuranIbuHamilBloc>().add(GetDetailRiwayatPengukuranIbuHamil(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Riwayat Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocBuilder<DetailRiwayatPengukuranIbuHamilBloc, DetailRiwayatPengukuranIbuHamilState>(
          builder: (context, state) {
            if(state is DetailRiwayatPengukuranIbuHamilLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is DetailRiwayatPengukuranIbuHamilFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            if(state is DetailRiwayatPengukuranIbuHamilSuccess){
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
                          ? sizeHeighofSingleForm * 3.3
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
                                text: state.data.data.ibuAnak.nik),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            const Text(
                              'Nama',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(
                                text: state.data.data.ibuAnak.namaIbu),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            const Text(
                              'Usia Kandungan',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(
                                text:
                                    state.data.data.usiaKehamilan.toString()),
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
                                      text: state.data.data.ibuAnak
                                          .kartuKeluarga.nomorKartuKeluarga),
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
                                  // InfoFieldWidget(
                                  //     text: state.data.data.ibuAnak.),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
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
                                            text: state.data
                                                .data
                                                .ibuAnak
                                                .dusun
                                                .desaKelurahan
                                                .kecamatan
                                                .kabupatenKota
                                                .provinsi
                                                .namaProvinsi),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data
                                                .data
                                                .ibuAnak
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
                                            text: state.data
                                                .data
                                                .ibuAnak
                                                .dusun
                                                .desaKelurahan
                                                .kecamatan
                                                .namaKecamatan),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data
                                                .data
                                                .ibuAnak
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
                                      text: state.data.data.ibuAnak
                                          .dusun.namaDusun),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data.data
                                                .ibuAnak.rt),
                                      ),
                                      Expanded(
                                        child: InfoFieldWidget(
                                            text: state.data.data
                                                .ibuAnak.rw),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  InfoFieldWidget(
                                    text: state.data.data
                                                .ibuAnak.alamat,
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
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    DataTableRiwayatIbuHamil()
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

class DataTableRiwayatIbuHamil extends StatelessWidget {
  const DataTableRiwayatIbuHamil({super.key});

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
                alignment: Alignment.centerLeft, child: Text('2024-01-15'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('5 bulan'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('170'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('65'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('35'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('20'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('12'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Azalea Melani'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-01-10'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('4 bulan 1 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('168'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('63'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('34'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('19'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Anastasia Mandasari'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('3'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-01-05'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('4 bulan'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('165'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('61'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('33'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('18'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('11'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Ellis Purnawati'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('4'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2023-12-30'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('3 bulan 3 minggu'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('162'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('59'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('32'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('17'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('10'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('Ya'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Cici Wahyuni '))),
          ]),
        ],
      ),
    );
  }
}
