import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/theme/pallet_color.dart';
import '../../../config/theme/text_style.dart';

class AlertDialogPetunjuk extends StatelessWidget {
  const AlertDialogPetunjuk({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
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
              child: Text(
                textAlign: TextAlign.center,
                'Petunjuk',
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Di dalam halaman faktor resiko permasalahan gizi terdapat daftar resiko yang memiliki bentuk kotak dengan ikon penanda masing-masing.",
            ),
            SizedBox(
              height: 16,
            ),
            ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide(
                  color: stroke10,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: stroke10,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: goldPrimaryMain, // Icon color
                size: 24,
              ),
              title: Text('BBLR'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Jenis Jenis Ikon Penanda : ',
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '1. Perlu diKerjakan',
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              FontAwesomeIcons.circleExclamation, // Font Awesome icon
              color: goldPrimaryMain, // Icon color
              size: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
              'Faktor resiko dengan ikon ini memiliki arti bahwa faktor resiko tersebut perlu di kerjakan atau di isi',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '2. Sudah diKerjakan',
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              FontAwesomeIcons.circleCheck,
              color: greenPrimaryMain,
              size: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
              'Faktor resiko dengan ikon ini memiliki arti bahwa faktor resiko tersebut sudah selesai di kerjakan, dan anda perlu menunggu jangka waktu tertentu sesuai dengan faktor resiko nya untuk dapat dikerjakan kembali.',
            )
          ],
        ),
      ),
    );
  }
}
