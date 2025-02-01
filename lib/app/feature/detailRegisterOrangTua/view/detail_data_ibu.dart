import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';

class DetailDataIbu extends StatelessWidget {
  final List<String> disabilitas = [
    'Tunanetra',
  ];
  DetailDataIbu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nomor Kartu Keluarga',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'INI KK'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'NIK',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'INI NIK'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nama Ayah',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'INI NAMA AYAH'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Tempat Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: 'INI TEMPAT LAHIR'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: 'INI TANGGAL LAHIR'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(text: 'Banyuwangi'),
                ),
                Expanded(
                  child: InfoFieldWidget(text: 'Kabat'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(text: 'Kabat'),
                ),
                Expanded(
                  child: InfoFieldWidget(text: 'Bunder'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(text: '2'),
                ),
                Expanded(
                  child: InfoFieldWidget(text: '14'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Alamat Lengkap'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nomor Telepon',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '018123141232'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Jenis KB',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: 'Implant'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Golongan Darah',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: 'A'),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'Tanggal kelahiran anak sebelumnya',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '21 Agustus 2023'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Jumlah Anak',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
              text: '2',
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            disabilitas != null && disabilitas.isNotEmpty
                ? ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    title: Text(
                      'Disabilitas',
                      style: AppTextStyles.primaryTextMedium.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    children: [
                      ...disabilitas.map(
                        (e) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 4),
                              child: Text(
                                e,
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              color: goldPrimaryMain,
              mainButtonMessage: 'Perbarui',
              mainButton: () {
                Navigator.pushNamed(context, UPDATE_REGISTER_ORANG_TUA);
              },
            ),
          ],
        ),
      ),
    );
  }
}
