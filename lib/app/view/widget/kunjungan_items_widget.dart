import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../utils/logger/logger.dart';
import '../screen/page_not_found_screen.dart';

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
    return GestureDetector(
      onTap: () {
        gateNavigatorKunjungan(context);
      },
      child: Container(
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
                      decoration: BoxDecoration(
                          color: item.status == Status.belumDiMulai
                              ? greenPrimaryMain
                              : item.status == Status.berjalan
                                  ? goldPrimaryMain
                                  : bluePrimaryMain,
                          borderRadius: BorderRadius.circular(4)),
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
                                  '${item.distance} KM',
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

  void gateNavigatorKunjungan(BuildContext context) {
    // ! anak stunting belum dimulai
    if (item.status == Status.belumDiMulai &&
        item.target == TargetOfKunjugan.anakStunting) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_STUNTING_NOT_STARTED);
      logger.d("Navigasi ke halaman untuk Anak Stunting yang belum dimulai");
      // ! anak tidak hadir belum dimulai
    } else if (item.status == Status.belumDiMulai &&
        item.target == TargetOfKunjugan.anakTidakHadir) {
      Navigator.pushNamed(
          context, DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_NOT_STARTED);
      logger.d("Navigasi ke halaman untuk Anak Tidak Hadir yang belum dimulai");
      // ! ibu hamil belum dimulai
    } else if (item.status == Status.belumDiMulai &&
        item.target == TargetOfKunjugan.ibuHamil) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_IBU_HAMIL_NOT_STARTED);
      logger.d("Navigasi ke halaman untuk Ibu Hamil yang belum dimulai");

      // ! anak stunting sedang berjalan
    } else if (item.status == Status.berjalan &&
        item.target == TargetOfKunjugan.anakStunting) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_STUNTING_ON_GOING);
      logger.d("Navigasi ke halaman untuk Anak Stunting yang sedang berjalan");

      // ! anak tidak hadir sedang berjalan
    } else if (item.status == Status.berjalan &&
        item.target == TargetOfKunjugan.anakTidakHadir) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_ON_GOING);
      logger
          .d("Navigasi ke halaman untuk Anak Tidak Hadir yang sedang berjalan");

      // ! ibu hamil sedang berjalan
    } else if (item.status == Status.berjalan &&
        item.target == TargetOfKunjugan.ibuHamil) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_IBU_HAMIL_ON_GOING);
      logger.d("Navigasi ke halaman untuk Ibu Hamil yang sedang berjalan");

      // ! anak stunting selesai
    } else if (item.status == Status.selesai &&
        item.target == TargetOfKunjugan.anakStunting) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_STUNTING_DONE);
      logger.d("Navigasi ke halaman untuk Anak Stunting yang sudah selesai");

      // ! anak tidak hadir selesai
    } else if (item.status == Status.selesai &&
        item.target == TargetOfKunjugan.anakTidakHadir) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_DONE);
      logger.d("Navigasi ke halaman untuk Anak Tidak Hadir yang sudah selesai");

      //! ibu hamil selesai
    } else if (item.status == Status.selesai &&
        item.target == TargetOfKunjugan.ibuHamil) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_IBU_HAMIL_DONE);
      logger.d("Navigasi ke halaman untuk Ibu Hamil yang sudah selesai");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PageNotFoundScreen();
          },
        ),
      );
      logger.d("Navigasi default");
    }
  }
}
