import 'package:flutter/material.dart';

import '../../../config/theme/pallet_color.dart';

class GenerateButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const GenerateButtonWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Generate',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: greenPrimaryMain,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 48), // Tinggi tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
