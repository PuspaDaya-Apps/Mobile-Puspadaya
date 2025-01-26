// ignore: file_names
import 'package:flutter/material.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class CardIbuhamilWidget extends StatelessWidget{
  const CardIbuhamilWidget({
    required this.nama,
    required this.nik,
    required this.bulan,
    required this.minggu,
    super.key
  });

  final String nama;
  final String nik;
  final String bulan;
  final String minggu;

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
            color: Colors.black.withOpacity(0.16),
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
                Text(
                  "Ayah : $nik",
                  style: TextStyle(
                    color: fontColor2.withOpacity(0.7),
                    fontSize: SizeConfig.calMultiplierText(12),
                    fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  "Usia Kandungan : $bulan Bulan $minggu Minggu",
                  style: TextStyle(
                    color: fontColor2.withOpacity(0.7),
                    fontSize: SizeConfig.calMultiplierText(12),
                    fontWeight: FontWeight.w400
                  ),
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