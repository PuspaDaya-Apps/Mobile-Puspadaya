import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class AlertChooseMeasuringTools extends StatelessWidget {
  final String title;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String selectedHeight;
  final String selectedWeight;
  final String selectedUpperArmCircumference;
  final String selectedUterineFundalHeight;
  final ValueChanged onHeightChanged;
  final ValueChanged onWeightChanged;
  final ValueChanged onUpperArmCircumferenceChanged;
  final ValueChanged onUterineFundalHeightChanged;

  List<String> selectHeight = [
    'Microtoise',
    'Alat Ukur Tinggi Badan',
    'Alat Ukur Lainnya',
  ];

  List<String> selectWeight = [
    'Timbangan Digital',
    'Timbangan Manual',
    'Timbangan Lainnya',
  ];

  List<String> selectUpperArmCircumference = [
    'Pita Lila',
    'Alat Ukur Lainnya',
  ];

  List<String> selectUterineFundalHeight = [
    'Metline',
    'Alat Ukur Lainnya',
  ];

  AlertChooseMeasuringTools({
    super.key,
    required this.title,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    required this.selectedHeight,
    required this.selectedWeight,
    required this.selectedUpperArmCircumference,
    required this.selectedUterineFundalHeight,
    required this.onHeightChanged,
    required this.onWeightChanged,
    required this.onUpperArmCircumferenceChanged,
    required this.onUterineFundalHeightChanged,
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            Text(
              'Tinggi Badan',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DropdownWidget(
              items: selectHeight,
              hint: 'Tinggi Badan',
              value: selectedHeight,
              onChanged: onHeightChanged, // Update selected height
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            Text(
              'Lingkar Lengan Atas',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DropdownWidget(
              items: selectUpperArmCircumference,
              hint: 'Lingkar Lengan Atas',
              value: selectedUpperArmCircumference,
              onChanged:
                  onUpperArmCircumferenceChanged, // Update selected upper arm circumference
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            Text(
              'Berat Badan',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DropdownWidget(
              items: selectWeight,
              hint: 'Berat Badan',
              value: selectedWeight,
              onChanged: onWeightChanged, // Update selected weight
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            Text(
              'Tinggi Fundus Uteri',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DropdownWidget(
              items: selectUterineFundalHeight,
              hint: 'Tinggi Fundus Uteri',
              value: selectedUterineFundalHeight,
              onChanged:
                  onUterineFundalHeightChanged, // Update selected uterine fundal height
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(30)),
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
          ],
        ),
      ),
    );
  }
}
