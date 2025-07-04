import 'package:flutter/material.dart';
import 'package:puspadaya/config/validator/form_field_data.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class ValidationScroll {
  static void validationScrollFirstClient(
      Map<GlobalKey<FormFieldState>, FocusNode> fieldMap) {
    for (var entry in fieldMap.entries) {
      final key = entry.key;
      final focusNode = entry.value;

      logger.d(
          'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
      // Cek apakah field ini punya error
      if (key.currentState?.hasError ?? false) {
        // Jika ya, scroll ke field ini

        print('Field ${entry.key} has error: ${key.currentState?.hasError}');
        print('Current context: ${key.currentContext}');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: 0.3,
          );
          focusNode.requestFocus();
        });

        // Hentikan loop karena kita hanya butuh fokus ke error pertama
        break;
      }
    }
  }

  static void validationScrollFirstServer(BuildContext context,
      Map<String, List<String>> errors, Map<String, FormFieldData> fieldMap) {
    for (final entry in errors.entries) {
      final field = fieldMap[entry.key];
      if (field != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Scrollable.ensureVisible(
            field.key.currentContext as BuildContext,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: 0.3,
          );
          field.focusNode.requestFocus();
        });
        break;
      }
    }
  }
}
