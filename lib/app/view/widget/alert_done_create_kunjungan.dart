import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/outline_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class AlertDoneCreateKunjungan extends StatelessWidget {
  final String totalDistance;
  final String totalDuration;
  const AlertDoneCreateKunjungan(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                width: 152,
                height: 156,
                image: AssetImage(imageDoneTask),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(23),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Kunjungan Anda Telah Selesai',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.calHeightMultiplier(16),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(12),
            ),
            // content
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
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(30),
            ),
            OutlineButton(
              color: stroke10,
              mainButtonMessage: 'Kembali',
              mainButton: () {
                Navigator.of(context)
                  ..pop()
                  ..pop()
                  ..pop()
                  ..pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
