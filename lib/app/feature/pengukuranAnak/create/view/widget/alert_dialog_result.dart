import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class AlertDialogResult extends StatelessWidget {
  final String nik;
  final String name;
  final String statusStunting;
  final String statusGizi;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;

  const AlertDialogResult({
    super.key,
    required this.nik,
    required this.name,
    required this.statusStunting,
    required this.statusGizi,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    this.cancelButtonMessage,
    this.cancelButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true, // Make the dialog scrollable
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure Column adapts to its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Hasil Pengukuran',
                style: AppTextStyles.primaryTextSemibold.copyWith(
                  fontSize: SizeConfig.calHeightMultiplier(16),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Text(
              'Identitas Anak',
              style: AppTextStyles.primaryTextSemibold.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(4)),
            Text(
              'NIK : ${nik}',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            Text(
              'Nama : ${name}',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Stunting',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: statusStunting),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Gizi',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: statusGizi),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(30)),
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
            if (cancelButtonMessage != null && cancelButton != null) ...[
              SizedBox(height: SizeConfig.calHeightMultiplier(12)),
              Center(
                child: GestureDetector(
                  onTap: cancelButton,
                  child: Text(
                    cancelButtonMessage!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
