import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class RiwayatBalitaItems extends StatelessWidget {
  final String name;
  final String nik;
  final String gender;
  int? year;
  int? month;
  final VoidCallback onTap;

  RiwayatBalitaItems({
    super.key,
    required this.onTap,
    this.year,
    this.month,
    required this.name,
    required this.nik,
    required this.gender,
  });

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
              child: Text(
                '$name',
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              spacing: 4,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "NIK : ",
                              style: AppTextStyles.primaryTextNormal.copyWith(
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
                      Text(
                        '$gender',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35, // Set a fixed height for the divider
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usia',
                          style: AppTextStyles.secoundaryTextNormal.copyWith(
                            fontSize: 8,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '2 ',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Tahun ',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              TextSpan(
                                text: '11 ',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Bulan',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
