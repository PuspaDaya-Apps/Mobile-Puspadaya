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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Checkbox(
            side: BorderSide(
              color: stroke10,
              width: 2,
            ),
            activeColor: bluePrimaryMain,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isChecked,
            onChanged: onChanged,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChanged(!isChecked);
            },
            child: Text(
              label,
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 16,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}
