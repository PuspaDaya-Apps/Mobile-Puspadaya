import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class InfoFieldWidget extends StatelessWidget {
  final String text;
  final Color? color;

  const InfoFieldWidget({super.key, required this.text, this.color});

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
          text,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, 
          style: AppTextStyles.primaryTextNormal.copyWith(
            color: color ?? textPrimary30, // Use color if not null, otherwise use textPrimary30
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}