import 'package:flutter/material.dart';

import '../../../config/theme/pallet_color.dart';

class TextFieldWidget2 extends StatelessWidget {
  final GlobalKey<FormFieldState>? formFieldKey;
  final int? maxLength;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onToggleVisibility;
  final bool? isEnable;

  final ValueSetter? valueSet;
  final FocusNode focusNode;
  final String? Function(String?)? validator;

  TextFieldWidget2(
      {super.key,
      this.formFieldKey,
      required this.focusNode,
      this.isEnable,
      this.validator,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.obscureText,
      required this.isPasswordField,
      this.onToggleVisibility,
      this.maxLength,
      this.valueSet});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
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
      ), // Call validateField only if validators are provided
      validator: validator,
      onChanged: (value) {
        // Hanya trigger perubahan jika benar-benar diperlukan
        valueSet?.call(value);
      },
    );
  }
}
