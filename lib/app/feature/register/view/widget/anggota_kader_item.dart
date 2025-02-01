import 'package:flutter/material.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';

class AnggotaKaderItem extends StatelessWidget {
  final Color color;
  const AnggotaKaderItem({super.key, required this.color});

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
                        'adawdw',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Target :adwd',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Status : ',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // divider
                        Container(
                          height: 32,
                          width: 2,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 50,
                        ),
                        // distance
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Jarak Tempuh',
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  textAlign: TextAlign
                                      .end, // Menyelaraskan teks ke kanan
                                  'KM',
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
