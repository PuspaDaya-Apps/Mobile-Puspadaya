import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/validator/validator.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onToggleVisibility;
  // final FormFieldValidator<String>? validator;
  List<String? Function(String)>? validators;
  TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.isPasswordField,
    this.onToggleVisibility,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
