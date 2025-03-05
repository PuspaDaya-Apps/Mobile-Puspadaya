import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

<<<<<<<< HEAD:lib/app/view/screen/under_development_screen.dart
class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});
========
class ErrorUnauthorizedScreen extends StatelessWidget {
  final String error;
  ErrorUnauthorizedScreen({super.key, required this.error});
>>>>>>>> temp:lib/app/view/screen/error_unauthorized_screen.dart

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
<<<<<<<< HEAD:lib/app/view/screen/under_development_screen.dart
                pageUnderDevelopmentVector,
========
                lostConnectionVector,
>>>>>>>> temp:lib/app/view/screen/error_unauthorized_screen.dart
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(20)),
            Text(
<<<<<<<< HEAD:lib/app/view/screen/under_development_screen.dart
              'Segera Datang',
========
              '${error}',
>>>>>>>> temp:lib/app/view/screen/error_unauthorized_screen.dart
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
