import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../config/screen_config/size_config.dart';
import 'primary_button_widget.dart';

class AlertDialogContent extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;
  final Color colorMainButton;

  const AlertDialogContent(
      {super.key,
      required this.title,
      required this.content,
      required this.mainButton,
      required this.mainButtonMessage,
      this.cancelButtonMessage,
      this.cancelButton,
      required this.colorMainButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            content,
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(12),
            ),
            // Tampilkan cancel button hanya jika keduanya tidak null
            if (cancelButtonMessage != null && cancelButton != null)
              GestureDetector(
                onTap: cancelButton,
                child: Text(
                  cancelButtonMessage!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
