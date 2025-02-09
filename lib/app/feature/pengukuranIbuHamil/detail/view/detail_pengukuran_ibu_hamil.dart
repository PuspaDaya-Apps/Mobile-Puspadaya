import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/app/feature/monitoring/model/riwayat_monitoring_ibu_hamil_model.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';

class DetailPengukuranIbuHamil extends StatelessWidget {
  final RiwayatMonitoringIbuHamilModel detailPengukuranIbuHamil;
  DetailPengukuranIbuHamil({super.key, required this.detailPengukuranIbuHamil});

  @override
  Widget build(BuildContext context) {
    return DetailPengukuranIbuHamilView(
      detailPengukuranIbuHamil: detailPengukuranIbuHamil,
    );
  }
}

class DetailPengukuranIbuHamilView extends StatefulWidget {
  final RiwayatMonitoringIbuHamilModel detailPengukuranIbuHamil;
  const DetailPengukuranIbuHamilView(
      {super.key, required this.detailPengukuranIbuHamil});

  @override
  State<DetailPengukuranIbuHamilView> createState() =>
      _DetailPengukuranIbuHamilViewState();
}

class _DetailPengukuranIbuHamilViewState
    extends State<DetailPengukuranIbuHamilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'NIK',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: widget.detailPengukuranIbuHamil.data.ibuAnak.nik),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nama Ibu Hamil',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: widget.detailPengukuranIbuHamil.data.ibuAnak.nama),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Usia Ibu Hamil',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: HelperData()
                        .countAge(widget
                            .detailPengukuranIbuHamil.data.ibuAnak.tanggalLahir)
                        .toString()),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Usia Kehamilan',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: widget.detailPengukuranIbuHamil.data.usiaKehamilan),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tempat Pengukuran',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: widget
                        .detailPengukuranIbuHamil.data.posyandu!.namaPosyandu),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Pengukuran',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: DateFormat('dd/MM/yyyy').format(widget
                        .detailPengukuranIbuHamil.data.tanggalTerakhirHaid)),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Badan',
                            unit: 'cm',
                            tool: 'Microtoise',
                            value:
                                '${widget.detailPengukuranIbuHamil.data.tinggiBadan}',
                          ),
                          InfoFieldMeasuringWidget(
                            title: 'Lengkar Lingan Atas',
                            unit: 'cm',
                            tool: 'Pita Lila',
                            value:
                                '${widget.detailPengukuranIbuHamil.data.lingkarLenganAtas}',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Berat Badan',
                            unit: 'kg',
                            tool: 'Timbangan digital',
                            value:
                                '${widget.detailPengukuranIbuHamil.data.beratBadan}',
                          ),
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Fundus Uteri',
                            unit: 'cm',
                            tool: 'Metline',
                            value:
                                '${widget.detailPengukuranIbuHamil.data.tinggiFundusUteri}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Hemogoblin',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(
                          text:
                              widget.detailPengukuranIbuHamil.data.hemoglobin),
                    ),
                    Text(
                      'g/dl',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Pertama Haid',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: DateFormat('dd/MM/yyyy').format(widget
                        .detailPengukuranIbuHamil.data.tanggalPertamaHaid)),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Terakhir Haid',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                    text: DateFormat('dd/MM/yyyy').format(widget
                        .detailPengukuranIbuHamil.data.tanggalTerakhirHaid)),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 8,
                        children: [
                          const Text(
                            'Terpapar Asap Rokok',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(
                              text: widget.detailPengukuranIbuHamil.data
                                  .terpaparAsapRokok),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Tablet Fe',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(
                              text: widget
                                  .detailPengukuranIbuHamil.data.jumlahTabletFe
                                  .toString()),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () {
                          Navigator.pushNamed(
                              context, UPDATE_PENGUKURAN_IBU_HAMIL);
                        },
                      ),
                    ),
                    Expanded(
                      child: ButtonPrimary(
                        color: redPrimaryMain,
                        mainButtonMessage: 'Hapus',
                        mainButton: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogWidget(
                                title: 'Apakah Anda Yakin?',
                                message:
                                    'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                mainButton: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                image: imageDeleteItems,
                                mainButtonMessage: 'Iya, Hapus Pengukuran',
                                colorMainButton: redPrimaryMain,
                                cancelButton: () {
                                  Navigator.pop(context);
                                },
                                cancelButtonMessage: 'Batalkan',
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
