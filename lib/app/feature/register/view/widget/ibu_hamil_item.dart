import 'package:flutter/material.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';

class IbuHamilItem extends StatelessWidget {
  final Color color;
  final String name;
  final String nik;
  final int month;
  final int week;
  const IbuHamilItem(
      {super.key,
      required this.color,
      required this.name,
      required this.nik,
      required this.month,
      required this.week});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            boxShadow: boxShadow(),
            borderRadius: BorderRadius.circular(12),
            color: color // Default to bluePrimaryMain if none match
            ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Text(
                        style: AppTextStyles.primaryTextMedium
                            .copyWith(fontSize: 14, color: Colors.white),
                        '${name}',
                      ),
                    ),
                    Text(
                      'NIK :${nik}',
                      style: AppTextStyles.secoundaryTextNormal.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Usia Kandungan : ${month} Bulan ${week} Minggu',
                      style: AppTextStyles.secoundaryTextNormal.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
