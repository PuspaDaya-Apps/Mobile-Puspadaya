import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import 'detail_data_wali.dart';

class DetailDataAnak extends StatelessWidget {
  final List<String> disabilitas = [
    'Tunanetra',
    'Tunarungu',
    'Tunawicara',
    'Tunadaksa',
    'Tunagharita',
    "Autisme",
  ];
  DetailDataAnak({super.key});

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
            InfoFieldWidget(text: 'INI KK'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nama',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'INI Nama'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Anak ke',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '2'),
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
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: '21,41 CM'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Berat Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: '2,4 KG'),
                    ],
                  ),
                ),
              ],
            ),
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
                        'Lingkar Lengan',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: '5,9 CM'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Lingkar Kepala',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: '10,4 CM'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Laki Laki'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Cara Lahir',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Cesar'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Status Kelahiran',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Normal'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Status Orang Tua Anak',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: 'Orang Tua Wali'),
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
              color: bluePrimaryMain,
              mainButtonMessage: 'Lihat Data Wali',
              mainButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDataWali(),
                  ),
                );
              },
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              color: goldPrimaryMain,
              mainButtonMessage: 'Perbarui',
              mainButton: () {
                Navigator.pushNamed(context, UPDATE_REGISTER_ANAK);
              },
            ),
          ],
        ),
      ),
    );
  }
}
