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

    print('Lebar layar = $screenWidth');
    print('Tinggi layar = $screenHeight');
    print('Rasio aspek = ${screenWidth / screenHeight}');
    print('Rasio piksel perangkat = $devicePixelRatio');
    print('Faktor skala teks = ${textScaler.scale(1.0)}');
    print('Orientasi = $orientation');
    print('Faktor skala lebar = $widthScaleFactor');
    print('Faktor skala tinggi = $heightScaleFactor');
    print('Faktor skala yang digunakan = $scaleFactor');
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