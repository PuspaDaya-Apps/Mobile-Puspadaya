import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class TopSnackbarWidget {

  CustomSnackBar success (String message) {
    return CustomSnackBar.success(
      message: message,
      maxLines: 2,
      messagePadding: const EdgeInsets.all(12),
    );
  }

  CustomSnackBar info (String message) {
    return CustomSnackBar.info(
      message: message,
      maxLines: 2,
      messagePadding: const EdgeInsets.all(12),
    );
  }

  CustomSnackBar warning (String message) {
    return CustomSnackBar.info(
      message: message,
      maxLines: 2,
      messagePadding: const EdgeInsets.all(12),
      backgroundColor: Colors.orange,
    );
  }

  CustomSnackBar error (String message) {
    return CustomSnackBar.error(
      message: message,
      maxLines: 2,
      messagePadding: const EdgeInsets.all(12),
    );
  }
}