import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;
  final Color colorMainButton;
  final String? image;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.mainButton,
    required this.mainButtonMessage,
    this.cancelButtonMessage,
    this.cancelButton,
    this.image, required this.colorMainButton,
  });

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image != null
                ? Image(
                    width: 152,
                    height: 156,
                    image: AssetImage(image!),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(23),
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(6),
            ),
            Text(
              textAlign: TextAlign.center,
              message,
              style: TextStyle(
                color: fontGray1,
                fontWeight: FontWeight.normal,
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(30),
            ),
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
