import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import 'alert_done_create_kunjungan.dart';

class AlertConfirmCreateKunjungan extends StatelessWidget {
  final String totalDistance;
  final String totalDuration;
  const AlertConfirmCreateKunjungan(
      {super.key, required this.totalDistance, required this.totalDuration});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 152,
              height: 156,
              image: AssetImage(imageCrossRoad),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(23),
            ),
            Text(
              textAlign: TextAlign.center,
              'Apakah Anda Ingin Melanjutkan Kunjungan?',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(6),
            ),
            // content
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Ringkasan Status Kunjungan',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.primaryTextMedium.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(12),
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    'Total Waktu Saat Ini',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  InfoFieldWidget(text: '${totalDuration}'),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(16),
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    'Jarak Tempu Saat Ini',
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
                        child: InfoFieldWidget(text: '${totalDistance}'),
                      ),
                      Text(
                        'KM',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(30),
            ),
            ButtonPrimary(
              mainButtonMessage: 'Lanjutkan Kunjungan',
              mainButton: () {
                Navigator.of(context)
                  ..pop()
                  ..pop()
                  ..pop();
              },
              color: greenPrimaryMain,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(4),
            ),
            Text('Atau'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(4),
            ),
            ButtonPrimary(
              mainButtonMessage: 'Selesai',
              mainButton: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDoneCreateKunjungan(
                      totalDistance: totalDistance,
                      totalDuration: totalDuration,
                    );
                  },
                );
              },
              color: bluePrimaryMain,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(12),
            ),
            // Tampilkan cancel button hanya jika keduanya tidak null
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batalkan',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
