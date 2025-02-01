import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class InfoFieldMeasuringWidget extends StatelessWidget {
  final String title;
  final String unit;
  final String? tool;
  final String value;
  const InfoFieldMeasuringWidget(
      {super.key,
      required this.title,
      required this.unit,
      this.tool,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: SizeConfig.calHeightMultiplier(8),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InfoFieldWidget(text: value),
            ),
            SizedBox(width: 6),
            Text(
              unit,
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.calHeightMultiplier(4),
        ),
        tool != null
            ? Text(
                'Alat : $tool',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 10,
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
