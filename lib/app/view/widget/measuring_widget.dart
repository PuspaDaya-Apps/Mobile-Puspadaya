import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';

class MeasurementWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final String unit;
  final List<String? Function(String)>? validator;
  // final String? tool;
  final TextEditingController controller;

  MeasurementWidget({
    Key? key,
    this.validator,
    required this.title,
    required this.hintText,
    required this.unit,
    // this.tool,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
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
              child: TextFieldWidget(
                controller: controller,
                hintText: hintText,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                obscureText: false,
                isPasswordField: false,
                validators: validator ?? [],
              ),
            ),
            const SizedBox(width: 6),
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
        // tool != null
        //     ? Text(
        //         'Alat : $tool',
        //         style: AppTextStyles.primaryTextNormal.copyWith(
        //           fontSize: 10,
        //         ),
        //       )
        //     : const SizedBox.shrink(),
      ],
    );
  }
}
