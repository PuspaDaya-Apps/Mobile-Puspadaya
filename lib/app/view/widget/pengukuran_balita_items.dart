import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class PengukuranBalitaItems extends StatelessWidget {
  final String name;
  final String nik;
  final String date;
  final String place;

  const PengukuranBalitaItems({
    super.key,
    required this.place,
    required this.name,
    required this.date,
    required this.nik,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: bluePrimary50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                spacing: 2,
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Tempat : ",
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
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: bluePrimary50,
      ),
    );
  }
}
