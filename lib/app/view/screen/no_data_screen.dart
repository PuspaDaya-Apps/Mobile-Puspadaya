import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              noDataVector,
              scale: SizeConfig.calMultiplierImage(200)
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(20)),
            Text(
              'Tidak Ada Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fontColor1,
                fontSize: SizeConfig.calMultiplierText(20),
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}