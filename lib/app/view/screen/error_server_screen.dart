import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class ErrorServerScreen extends StatelessWidget {
  const ErrorServerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeConfig.calWidthMultiplier(250),
              child: Image.asset(
                lostConnectionVector,
                fit: BoxFit.fitWidth,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if(wasSynchronouslyLoaded) {
                    return child;
                  } else {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: frame != null ? child : SizedBox(
                        width: SizeConfig.calWidthMultiplier(250),
                        height: MediaQuery.sizeOf(context).height / 4,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.warning_amber_rounded,
                    size: SizeConfig.calWidthMultiplier(250) / 2,
                    color: Colors.red,
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(20)),
            Text(
              'Ada Kesalahan Saat Mengambil Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textPrimary20,
                  fontSize: SizeConfig.calMultiplierText(20),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
