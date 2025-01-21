import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class InfoFieldWidget extends StatelessWidget {
  final String text;
  const InfoFieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundWhite10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          textAlign: TextAlign.start,
          '${text}',
          style: AppTextStyles.primaryTextNormal.copyWith(
            color: textPrimary30,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
