import 'package:flutter/material.dart';
import 'package:puspadaya/config/validator/form_error_provider.dart';

import '../../../config/theme/pallet_color.dart';

class TextFieldWidget2 extends StatelessWidget {
  final String fieldName; // ini harus sama dengan nama key dari error
  final GlobalKey<FormFieldState>? formFieldKey;
  final int? maxLength;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onToggleVisibility;
  final bool? isEnable;
  final GestureTapCallback onTap;
  final ValueSetter? valueSet;
  final FocusNode focusNode;
  final List<FormFieldValidator<String>>? clientValidators;

  TextFieldWidget2({
    super.key,
    this.formFieldKey,
    this.isEnable,
    this.onToggleVisibility,
    this.maxLength,
    this.valueSet,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.isPasswordField,
    required this.onTap,
    required this.clientValidators,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    final errorProvider = FormErrorProvider.of(context);
    final serverError = errorProvider?.errors?[fieldName]?.join(', ');
    return TextFormField(
      onTap: onTap,
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
        errorText: serverError,
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
      validator: (value) {
        // client validator
        if (clientValidators != null) {
          for (var validator in clientValidators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        // 2. Server validation (ambil dari state/error provider)
        if (serverError != null) {
          final error = serverError;
          if (error != null) {
            return error;
          }
        }
      },
      onChanged: (value) {
        // Hanya trigger perubahan jika benar-benar diperlukan
        valueSet?.call(value);
      },
    );
  }
}
