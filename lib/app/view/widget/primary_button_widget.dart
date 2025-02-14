import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color color;
  const ButtonPrimary({
    super.key,
    required this.color,
    required this.mainButtonMessage,
    required this.mainButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: mainButton,
      child: Text(
        mainButtonMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
