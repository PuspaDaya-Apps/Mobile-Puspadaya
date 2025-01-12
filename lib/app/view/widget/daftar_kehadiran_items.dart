import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DaftarKehadiranItems extends StatelessWidget {
  final String location;
  final String date;
  final String duration;
  final String status;
  const DaftarKehadiranItems({
    super.key,
    required this.duration,
    required this.status,
    required this.location,
    required this.date,
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
              child: Text(
                '$location, $date',
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
                    text: "Durasi : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: duration,
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
                    text: "Status Kegiatan : ",
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: status,
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
