import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class RiwayatIbuHamilItems extends StatelessWidget {
  final String name;
  final String nik;
  final String gestationalAge;

  const RiwayatIbuHamilItems({
    super.key,
    required this.name,
    required this.nik,
    required this.gestationalAge,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
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
              child: Text(
                '$name',
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "NIK : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: nik,
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
                    text: "Usia Kandungan : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: gestationalAge,
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
