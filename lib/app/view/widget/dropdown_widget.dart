import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DropdownWidget extends StatelessWidget {
  final List<String> items;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onSaved;
  final String hint;
  final String value;
  final FormFieldValidator<String>? validator;
  DropdownWidget(
      {super.key,
      required this.items,
      this.onChanged,
      required this.hint,
      this.validator,
      required this.value,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      style: AppTextStyles.primaryTextNormal.copyWith(
        fontSize: 12,
      ),
      value: value,
      hint: Text(
        hint,
        style: AppTextStyles.secoundaryTextNormal.copyWith(
          fontSize: 12,
        ),
      ),
      buttonStyleData: ButtonStyleData(
        elevation: 0,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          // borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: backgroundWhite10,
        ),
        elevation: 0,
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
            ),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: redPrimaryMain),
        ),
      ),
    );
  }
}
