import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color color;

  const OutlineButton({
    super.key,
    required this.color,
    required this.mainButtonMessage,
    required this.mainButton,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: mainButton,
      child: Text(
        mainButtonMessage,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: color,
        minimumSize: const Size(double.infinity, 52),
        side: BorderSide(
          style: BorderStyle.solid,
          width: 2,
          color: color,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
