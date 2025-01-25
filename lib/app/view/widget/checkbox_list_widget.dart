import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class CheckboxListWidget extends StatelessWidget {
  final bool isChecked;
  final String label;
  final ValueChanged<bool?> onChanged;

  const CheckboxListWidget({
    Key? key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(
            color: stroke10,
            width: 2,
          ),
          activeColor: Colors.blue.shade400,
          checkColor: Colors.white,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isChecked,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () {
            onChanged(!isChecked);
          },
          child: Text(
            label,
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
