import 'package:flutter/material.dart';

class FormFieldData {
  final GlobalKey<FormFieldState<dynamic>> key;
  final FocusNode focusNode;

  FormFieldData({required this.key, required this.focusNode});
}