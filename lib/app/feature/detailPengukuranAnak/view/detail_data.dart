import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

class DetailData extends StatefulWidget {
  const DetailData({super.key});

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
            InfoFieldWidget(text: '354635284658310023'),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nama',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Zahra Hazza Khusnul Khotimah'),
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
            InfoFieldWidget(text: 'Posyandu'),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Tanggal',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '18/09/2024'),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Posisi Pengukuran Tinggi badan',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Berdiri'),
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
                        value: '31.67',
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lengkar Lingan Atas',
                        unit: 'cm',
                        tool: 'Pita Lila',
                        value: '5.7',
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
                        value: '8.9',
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lingkar Kepala',
                        unit: 'cm',
                        tool: 'Alat Ukur Linkar Kepala',
                        value: '10.8',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Asi Ekslusif',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Tidak'),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'MPASI',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Iya'),
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
                        'Status Stunting',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(text: 'Normal'),
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
                        'Status Gizi',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(text: 'Normal'),
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
                      Navigator.pushNamed(context, UPDATE_PENGUKURAN_ANAK);
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
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black54,
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
          ],
        ),
      ),
    );
  }
}
