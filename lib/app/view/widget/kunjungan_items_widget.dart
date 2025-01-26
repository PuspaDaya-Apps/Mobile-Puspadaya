import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class KunjunganItemWidget extends StatelessWidget {
  // final Status status;
  // final TargetOfKunjugan target;
  // final double distance;
  // final DateTime date;
  KunjunganItem item;
  KunjunganItemWidget({
    required this.item,
    super.key,
  });
  List<String> days = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu",
    "Minggu"
  ];
  List<String> month = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "July",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow(),
        borderRadius: BorderRadius.circular(12),
        color: item.status == Status.belumDiMulai
            ? greenPrimaryMain
            : item.status == Status.berjalan
                ? goldPrimaryMain
                : bluePrimaryMain, // Default to bluePrimaryMain if none match
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
                    color: item.status == Status.belumDiMulai
                        ? greenPrimaryMain
                        : item.status == Status.berjalan
                            ? goldPrimaryMain
                            : bluePrimaryMain,
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                      style: AppTextStyles.primaryTextMedium
                          .copyWith(fontSize: 14, color: Colors.white),
                      '${days[item.date.weekday - 1]}, ${item.date.day} ${month[item.date.month - 1]} ${item.date.year}',
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
                              'Target : ${item.target == TargetOfKunjugan.anakStunting ? 'Anak Stunting' : item.target == TargetOfKunjugan.anakTidakHadir ? 'Anak Tidak Hadir' : 'Ibu Hamil'}',
                              style:
                                  AppTextStyles.secoundaryTextNormal.copyWith(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Status : ${item.status == Status.belumDiMulai ? 'Belum Dimulai' : item.status == Status.berjalan ? 'Berjalan' : 'Selesai'}',
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
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
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
                                '${item.distance} KM',
                                style:
                                    AppTextStyles.secoundaryTextNormal.copyWith(
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
    );
  }
}
