import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class CardAlatUkurWidget extends StatelessWidget {
  const CardAlatUkurWidget({
    required this.nama,
    required this.merek,
    required this.kondisi,
    super.key,
    required this.onTap});

  final String nama;
  final String merek;
  final String kondisi;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery
            .sizeOf(context)
            .width,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.calHeightMultiplier(8),
            horizontal: SizeConfig.calWidthMultiplier(14)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 3)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: bluePrimary90,
              radius: 20,
              child: FaIcon(
                FontAwesomeIcons.rulerCombined,
                color: Colors.white, // Berikan warna agar lebih kontras
                size: 18, // Sesuaikan ukuran ikon agar pas
              ),
            ),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(16),
            ),
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.calWidthMultiplier(14),
                          vertical: SizeConfig.calHeightMultiplier(3)),
                      decoration: BoxDecoration(
                          color: bluePrimaryMain,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        nama,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.calMultiplierText(15),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(6),
                    ),
                    Text(
                      "Merek : $merek",
                      style: TextStyle(
                          color: textPrimary10.withOpacity(0.7),
                          fontSize: SizeConfig.calMultiplierText(12),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "kondisi : $kondisi",
                      style: TextStyle(
                          color: textPrimary10.withOpacity(0.7),
                          fontSize: SizeConfig.calMultiplierText(12),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(16),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: bluePrimaryMain,
              size: SizeConfig.calWidthMultiplier(14),
            )
          ],
        ),
      ),
    );
  }
}