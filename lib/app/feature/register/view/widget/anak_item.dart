import 'package:flutter/material.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';

class AnakItem extends StatelessWidget {
  final Color color;
  final String name;
  final String nik;
  final String gender;
  final int month;
  final int? year;
  const AnakItem(
      {super.key,
      required this.color,
      required this.name,
      required this.nik,
      required this.month,
      this.year,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            boxShadow: boxShadow(),
            borderRadius: BorderRadius.circular(12),
            color: color // Default to bluePrimaryMain if none match
            ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Text(
                        style: AppTextStyles.primaryTextMedium
                            .copyWith(fontSize: 14, color: Colors.white),
                        '${name}',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIK : ${nik}',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${gender}',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // divider
                        Container(
                          height: 32,
                          width: 2,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: SizedBox(
                            height: SizeConfig.calHeightMultiplier(35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Usia',
                                  style: TextStyle(
                                      color: textPrimary10.withOpacity(0.7),
                                      fontSize:
                                          SizeConfig.calMultiplierText(13),
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: textPrimary10.withOpacity(0.7),
                                          fontWeight: FontWeight.w400),
                                      children: [
                                        if (year != null)
                                          TextSpan(
                                            text: year.toString(),
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.calMultiplierText(
                                                      26),
                                            ),
                                          ),
                                        if (year != null)
                                          TextSpan(
                                            text: ' Tahun ',
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.calMultiplierText(
                                                      13),
                                            ),
                                          ),
                                        TextSpan(
                                            text: month.toString(),
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.calMultiplierText(
                                                      26),
                                            )),
                                        TextSpan(
                                          text: ' Bulan',
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.calMultiplierText(
                                                    13),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
