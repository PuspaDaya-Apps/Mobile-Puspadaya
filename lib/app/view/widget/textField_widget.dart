// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/validator/validator.dart';

class TextFieldWidget extends StatelessWidget {
  final int? maxLength;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onToggleVisibility;
  final bool? isEnable;
  // final FormFieldValidator<String>? validator;
  final List<String? Function(String)>? validators;
  final ValueSetter? valueSet;

  TextFieldWidget(
      {super.key,
      this.isEnable,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.obscureText,
      required this.isPasswordField,
      this.onToggleVisibility,
      this.validators,
      this.maxLength,
      this.valueSet});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      enabled: isEnable ?? true,
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: backgroundWhite10,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: greenPrimaryMain),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: stroke10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
      validator: (value) => validators != null
          ? Validator.validateField(
              value!,
              validators!,
            )
          : null, // Call validateField only if validators are provided
      onChanged: (value) {
        if (valueSet != null) {
          valueSet!(
              value); // Gunakan valueSet untuk update eksternal tanpa mereset controller
        }
      },
    );
  }
}
