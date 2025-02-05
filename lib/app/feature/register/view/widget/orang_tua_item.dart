import 'package:flutter/material.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';

class OrangTuaItem extends StatelessWidget {
  final Color color;
  final String husband;
  final String wife;
  final String kk;
  const OrangTuaItem(
      {super.key,
      required this.color,
      required this.husband,
      required this.wife,
      required this.kk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            boxShadow: shadowSm,
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
                        '${kk}',
                      ),
                    ),
                    Text(
                      'Ayah : ${husband}',
                      style: AppTextStyles.secoundaryTextNormal.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Ibu : ${wife} ',
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
