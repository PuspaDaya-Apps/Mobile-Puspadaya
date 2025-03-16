import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color color;
  bool? isLoading;

  ButtonPrimary({
    super.key,
    required this.color,
    required this.mainButtonMessage,
    required this.mainButton,
    this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: mainButton,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isLoading == null 
      ? Text(
        mainButtonMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      )
      : Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
