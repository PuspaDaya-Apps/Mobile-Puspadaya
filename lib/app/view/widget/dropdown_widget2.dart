import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DropdownWidget2 extends StatelessWidget {
  final List<String> items;
  final ValueChanged<dynamic>? onChanged;
  final FocusNode focusNode;
  final GlobalKey<FormFieldState>? formFieldKey;
  final ValueChanged<dynamic>? onSaved;
  final String hint;
  final String? value; // Ubah menjadi nullable
  final FormFieldValidator<String>? validator;

  DropdownWidget2({
    super.key,
    required this.focusNode,
    this.formFieldKey,
    required this.items,
    this.onChanged,
    required this.hint,
    this.validator,
    this.value,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      focusNode: focusNode,
      key: formFieldKey,

      isExpanded: true,
      style: AppTextStyles.primaryTextNormal.copyWith(
        fontSize: 12,
      ),
      value: value, // Ini bisa null
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
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
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
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: redPrimaryMain),
        ),
      ),
    );
  }
}
