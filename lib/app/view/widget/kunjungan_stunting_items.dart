import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class KunjunganStuntingItems extends StatelessWidget {
  final String name;
  final String nik;
  final String parent;
  final VoidCallback onTap;

  const KunjunganStuntingItems({
    super.key,
    required this.onTap,
    required this.name,
    required this.nik,
    required this.parent,
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
              children: [
                Text(
                  "NIK : ${nik}",
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 30,
                ),
                Container(
                  height: 25, // Set a fixed height for the divider
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 50,
                ),
                Expanded(
                  child: Text(
                    "Ibu : ${parent}",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
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
