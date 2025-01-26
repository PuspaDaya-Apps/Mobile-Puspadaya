import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class AutoSizeTextInfoFieldWidget extends StatelessWidget {
  final String text;

  const AutoSizeTextInfoFieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundWhite10,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 160,
      child: SingleChildScrollView(
        // Make the text scrollable
        child: Text(
          text, // No need for string interpolation here
          style: AppTextStyles.primaryTextNormal.copyWith(
            color: textPrimary30,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
