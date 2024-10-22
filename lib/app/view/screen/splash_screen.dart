import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: SizeConfig.calWidthMultiplier(97.5),
              child: Image.asset(
                logoText,
                width: SizeConfig.calMultiplierImage(125),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: SizeConfig.calHeightMultiplier(25) 
              ),
              child: Text(
                "V. 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.calMultiplierText(18),
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}