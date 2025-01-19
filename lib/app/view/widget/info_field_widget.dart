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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundWhite10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${text}',
        style: AppTextStyles.primaryTextNormal.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
