import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static late double devicePixelRatio;
  static const int mockupWidth = 375;
  static const int mockupHeight = 800;

  static void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    devicePixelRatio = mediaQuery.devicePixelRatio;
    TextScaler textScaler = mediaQuery.textScaler;
    Orientation orientation = mediaQuery.orientation;

    // Menghitung scaling factor
    double widthScaleFactor = screenWidth / mockupWidth;
    double heightScaleFactor = screenHeight / mockupHeight;
    double scaleFactor = (orientation == Orientation.portrait)
        ? widthScaleFactor
        : heightScaleFactor;

    textMultiplier = scaleFactor;
    imageSizeMultiplier = scaleFactor;
    heightMultiplier = heightScaleFactor;
    widthMultiplier = widthScaleFactor;

    debugPrint('Lebar layar = $screenWidth');
    debugPrint('Tinggi layar = $screenHeight');
    debugPrint('Rasio aspek = ${screenWidth / screenHeight}');
    debugPrint('Rasio piksel perangkat = $devicePixelRatio');
    debugPrint('Faktor skala teks = ${textScaler.scale(1.0)}');
    debugPrint('Orientasi = $orientation');
    debugPrint('Faktor skala lebar = $widthScaleFactor');
    debugPrint('Faktor skala tinggi = $heightScaleFactor');
    debugPrint('Faktor skala yang digunakan = $scaleFactor');
  }

  static double calMultiplierText(double textSize) {
    double size = textSize / textMultiplier;
    return double.parse((size * textMultiplier).toStringAsFixed(1));
  }

  static double calMultiplierImage(double imageSize) {
    double size = imageSize / imageSizeMultiplier;
    return double.parse((size * imageSizeMultiplier).toStringAsFixed(1));
  }

  static double calWidthMultiplier(double widthSize) {
    double size = widthSize / widthMultiplier;
    return double.parse((size * widthMultiplier).toStringAsFixed(1));
  }

  static double calHeightMultiplier(double heightSize) {
    double size = heightSize / heightMultiplier;
    return double.parse((size * heightMultiplier).toStringAsFixed(1));
  }
}