import 'package:flutter/material.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class CardAnakWidget extends StatelessWidget{
  const CardAnakWidget({
    required this.nama,
    required this.nik,
    required this.gender,
    required this.tahun,
    required this.bulan,
    super.key
  });

  final String nama;
  final String nik;
  final String gender;
  final String tahun;
  final String bulan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.calHeightMultiplier(8),
        horizontal: SizeConfig.calWidthMultiplier(14)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.black.withValues(alpha: 0.16),
            // color: Colors.black.withOpacity(0.16),
            blurRadius: 3
          )
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.calWidthMultiplier(14),
                    vertical: SizeConfig.calHeightMultiplier(3)
                  ),
                  decoration: BoxDecoration(
                    color: buttonLoginColor,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(
                    nama,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.calMultiplierText(15),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(6),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: SizeConfig.calWidthMultiplier(122),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NIK : $nik",
                            style: TextStyle(
                              color: fontColor2.withOpacity(0.7),
                              fontSize: SizeConfig.calMultiplierText(12),
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            gender,
                            style: TextStyle(
                              color: fontColor2.withOpacity(0.7),
                              fontSize: SizeConfig.calMultiplierText(12),
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.calWidthMultiplier(10)
                      ),
                      child: Container(
                        color: baseColor,
                        height: SizeConfig.calHeightMultiplier(35),
                        width: 1.5,
                      ),
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
                                color: fontColor2.withOpacity(0.7),
                                fontSize: SizeConfig.calMultiplierText(13),
                                fontWeight: FontWeight.w400
                              ),
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
                                    color: fontColor2.withOpacity(0.7),
                                    fontWeight: FontWeight.w400
                                  ),
                                  children: [
                                    TextSpan(
                                      text: tahun,
                                      style: TextStyle(
                                        fontSize: SizeConfig.calMultiplierText(26),
                                      )
                                    ),
                                    TextSpan(
                                      text: ' Tahun ',
                                      style: TextStyle(
                                        fontSize: SizeConfig.calMultiplierText(13),
                                      )
                                    ),
                                    TextSpan(
                                      text: bulan,
                                      style: TextStyle(
                                        fontSize: SizeConfig.calMultiplierText(26),
                                      )
                                    ),
                                    TextSpan(
                                      text: ' Bulan',
                                      style: TextStyle(
                                        fontSize: SizeConfig.calMultiplierText(13),
                                      )
                                    )
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ) 
          ),
          SizedBox(
            width: SizeConfig.calWidthMultiplier(16),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: baseColor,
            size: SizeConfig.calWidthMultiplier(14),
          )
        ],
      ),
    );
  }
}