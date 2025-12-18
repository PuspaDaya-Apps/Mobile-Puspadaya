import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../config/screen_config/size_config.dart';

class PengukuranTamuItems extends StatelessWidget {
  final String name;
  final String nik;
  final String place;
  final String date;
  final VoidCallback onTap;
  final bool? pengukuranIsNull;
  final int number;

  const PengukuranTamuItems({
    super.key,
    required this.onTap,
    required this.name,
    required this.date,
    required this.nik,
    required this.place,
    this.pengukuranIsNull,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Container(
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                 Container(
                  height: SizeConfig.calHeightMultiplier(45),
                  width: SizeConfig.calHeightMultiplier(45),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: pengukuranIsNull != null
                        ? bluePrimary50
                        : goldPrimaryMain,
                    width: 1.5
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    number.toString(),
                    style: AppTextStyles.primaryTextBold.copyWith(
                      color: pengukuranIsNull != null
                        ? bluePrimary50
                        : goldPrimaryMain,
                      fontSize: SizeConfig.calMultiplierText(20),
                      fontWeight: FontWeight.w600
                    ),
                  )
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: pengukuranIsNull != null
                    ? bluePrimary50
                    : goldPrimaryMain,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    spacing: 1,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'NIK : $nik',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Posyandu Asal : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: place,
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Tanggal : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: date,
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // trailing: Icon(
      //   Icons.arrow_forward_ios,
      //   color: pengukuranIsNull != null
      //   ? bluePrimary50
      //   : goldPrimaryMain,
      // ),
    );
  }
}
