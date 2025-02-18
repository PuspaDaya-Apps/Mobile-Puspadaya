import 'package:flutter/material.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';
import '../../../config/theme/shadow.dart';

class CardSelectBulanWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String bulan;
  final String tahun;

  const CardSelectBulanWidget({
    super.key,
    required this.onTap,
    required this.bulan,
    required this.tahun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Remove the fixed width to allow the container to size itself based on content
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.calHeightMultiplier(10),
          horizontal: SizeConfig.calWidthMultiplier(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: shadowSm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max, // Set to min to size based on content
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.calWidthMultiplier(14),
                vertical: SizeConfig.calHeightMultiplier(3),
              ),
              decoration: BoxDecoration(
                color: bluePrimaryMain,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$bulan $tahun',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.calMultiplierText(15),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(16),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: bluePrimaryMain,
              size: SizeConfig.calWidthMultiplier(14),
            ),
          ],
        ),
      ),
    );
  }
}
