import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class AlertDialogSave extends StatelessWidget {
  final String heighValue;
  final String weightValue;
  final String upperArmCircumference;
  final String uterineFundalHeightValue;
  final bool isAgeLessThanSixMonths;

  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;
  const AlertDialogSave({
    super.key,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    this.cancelButtonMessage,
    this.cancelButton,
    required this.heighValue,
    required this.weightValue,
    required this.upperArmCircumference,
    required this.uterineFundalHeightValue,
    required this.isAgeLessThanSixMonths,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true, // Make the dialog scrollable
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
              child: Image(
                image: AssetImage(imageConfirmSave),
                height: 200,
                width: 200,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Apakah Anda Yakin Untuk Menyimpan Data?',
              style: AppTextStyles.primaryTextSemibold.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Text(
              textAlign: TextAlign.start,
              'Data Pengukuran : ',
              style: AppTextStyles.secoundaryText.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Tinggi Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: heighValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      isAgeLessThanSixMonths == false ?SizedBox(height: SizeConfig.calHeightMultiplier(16)):SizedBox.shrink(),
                      isAgeLessThanSixMonths == false 
                          ? Text(
                              'Lingkar Lengan Atas',
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            )
                          : SizedBox.shrink(),
                      isAgeLessThanSixMonths == false ?SizedBox(height: SizeConfig.calHeightMultiplier(8)):SizedBox.shrink(),
                      isAgeLessThanSixMonths == false  ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: upperArmCircumference,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ):SizedBox.shrink(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Berat Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: weightValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'kg',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      isAgeLessThanSixMonths == false ?Text(
                        'Tinggi Fundus Uteri',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ):SizedBox.shrink(),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      isAgeLessThanSixMonths == false ?Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: uterineFundalHeightValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ):SizedBox.shrink(),
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
            SizedBox(
              height: SizeConfig.calHeightMultiplier(12),
            ),
            // Tampilkan cancel button hanya jika keduanya tidak null
            if (cancelButtonMessage != null && cancelButton != null)
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
              )
          ],
        ),
      ),
    );
  }
}
