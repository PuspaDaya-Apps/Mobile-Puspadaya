import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function(int) onChanged;
  final String label;

  const CustomRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? bluePrimaryMain : stroke10,
                width: 2,
              ),
              color: isSelected ? bluePrimaryMain : Colors.transparent,
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? bluePrimaryMain : textPrimary10,
            ),
          ),
        ],
      ),
    );
  }
}
