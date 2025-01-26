import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class KunjunganIbuHamilItem extends StatelessWidget {
  final String name;
  final String nik;
  final String husband;
  final VoidCallback onTap;
  const KunjunganIbuHamilItem(
      {super.key,
      required this.name,
      required this.onTap,
      required this.nik,
      required this.husband});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Suami : ${husband}",
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
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
