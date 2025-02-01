import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class DateTimePickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isDate;
  final FormFieldValidator<String>? validator;
  final VoidCallback? selectDate;
  const DateTimePickerWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.selectDate,
      required this.isDate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: selectDate,
      style: Theme.of(context).textTheme.bodySmall,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
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
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        suffixIcon: isDate ? Icon(Icons.calendar_today) : null,
      ),
      validator: validator,
    );
  }
}
