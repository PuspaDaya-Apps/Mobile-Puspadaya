import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DropdownWidget extends StatelessWidget {
  final List<String> items;
  final ValueChanged<dynamic>? onChanged;
  final String hint;
  final String value;
  DropdownWidget(
      {super.key,
      required this.items,
      this.onChanged,
      required this.hint,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: AppTextStyles.primaryTextNormal.copyWith(
        fontSize: 14,
      ),
      value: value,
      items: items.map((city) {
        return DropdownMenuItem(
          value: city,
          child: Text(city),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
            ),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: redPrimaryMain),
        ),
      ),
    );
  }
}
