import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class AppTextStyles {
  static TextStyle primaryText = const TextStyle(
    fontFamily: 'Poppins',
    color: textPrimary10,
  );

  static TextStyle secoundaryText = const TextStyle(
    fontFamily: 'Poppins',
    color: textSecoundary,
  );

  static TextStyle thridText = const TextStyle(
    fontFamily: 'Poppins',
    color: textSecoundary,
  );

  static TextStyle urgentText = const TextStyle(
    fontFamily: 'Poppins',
    color: textUrgent,
  );

  static TextStyle primaryTextNormal = primaryText.copyWith(
    fontWeight: FontWeight.normal,
  );
  static TextStyle primaryTextMedium = primaryText.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle primaryTextSemibold = primaryText.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle primaryTextBold = primaryText.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle primaryTextExtraBold = primaryText.copyWith(
    fontWeight: FontWeight.w800,
  );

  static TextStyle secoundaryTextNormal = secoundaryText.copyWith(
    fontWeight: FontWeight.normal,
  );
  static TextStyle secoundaryTextMedium = secoundaryText.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle secoundaryTextSemibold = secoundaryText.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle secoundaryTextBold = secoundaryText.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle secoundaryTextExtraBold = secoundaryText.copyWith(
    fontWeight: FontWeight.w800,
  );

  static TextStyle thridTextNormal = thridText.copyWith(
    fontWeight: FontWeight.normal,
  );
  static TextStyle thridTextMedium = thridText.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle thridTextSemibold = thridText.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle thridTextBold = thridText.copyWith(
    fontWeight: FontWeight.w800,
  );

  static TextStyle urgentTextNormal = urgentText.copyWith(
    fontWeight: FontWeight.normal,
  );
  static TextStyle urgentTextMedium = urgentText.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle urgentTextSemibold = urgentText.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle urgentTextBold = urgentText.copyWith(
    fontWeight: FontWeight.w800,
  );
}
