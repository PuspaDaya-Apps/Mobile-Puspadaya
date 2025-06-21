// form_error_provider.dart
import 'package:flutter/material.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class FormErrorProvider extends InheritedWidget {
  final Map<String, List<String>>? errors;

  const FormErrorProvider({
    required this.errors,
    required super.child,
    super.key,
  });

  static FormErrorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormErrorProvider>();
  }

  @override
  bool updateShouldNotify(FormErrorProvider oldWidget) {
    logger.d('error on form error provider $errors');
    return errors != oldWidget.errors;
  }
}