import 'package:flutter/material.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class CardPengasuhWidget extends StatelessWidget {
  const CardPengasuhWidget(
      {required this.nama,
      required this.nik,
      required this.namaAnak,
      super.key,
      required this.onTap,
      this.isUpdate,
      this.inRegister = false});

  final String nama;
  final String nik;
  final String namaAnak;
  final VoidCallback onTap;
  final bool? isUpdate;
  final bool inRegister;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
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
                      color: isUpdate == null && inRegister == true
                      ? goldPrimaryMain
                      : bluePrimaryMain,
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.calMultiplierText(14),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'nik : $nik',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.calMultiplierText(12),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(6),
                ),
                Text(
                  "Anak : $namaAnak",
                  style: TextStyle(
                      color: textPrimary10.withOpacity(0.7),
                      fontSize: SizeConfig.calMultiplierText(12),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(16),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isUpdate == null && inRegister == true
                      ? goldPrimaryMain
                      : bluePrimaryMain,
              size: SizeConfig.calWidthMultiplier(14),
            )
          ],
        ),
      ),
    );
  }
}
