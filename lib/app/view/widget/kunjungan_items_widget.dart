import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../utils/constant/constanst.dart';
import '../../../utils/logger/logger.dart';
import '../screen/page_not_found_screen.dart';

class KunjunganItemWidget extends StatelessWidget {
  final String id;
  final String nama;
  final Status status;
  final TargetOfKunjugan target;
  // final double distance;
  final DateTime date;
  // final KunjunganItem item;
  const KunjunganItemWidget({
    required this.id,
    required this.nama,
    required this.status,
    required this.target,
    required this.date,
    // required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gateNavigatorKunjungan(context);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: shadowSm,
          borderRadius: BorderRadius.circular(12),
          color: status == Status.berjalan
                  ? goldPrimaryMain
                  : bluePrimaryMain,
          // item.status == Status.belumDiMulai
          //     ? greenPrimaryMain
          //     :  // Default to bluePrimaryMain if none match
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 16),
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
                          color: status == Status.berjalan
                                ? goldPrimaryMain
                                : bluePrimaryMain,
                          // item.status == Status.belumDiMulai
                          //     ? greenPrimaryMain
                          //     : item.status == Status.berjalan
                          //         ? goldPrimaryMain
                          //         : bluePrimaryMain,
                          borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Text(
                        nama,
                        style: AppTextStyles.primaryTextMedium
                          .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat("d MMMM y").format(date),
                                
                                style:
                                    AppTextStyles.secoundaryTextMedium.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12.5,
                                ),
                              ),
                              Text(
                                status == Status.berjalan ? 'Berjalan' : 'Selesai',
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
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                // Align(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(
                                //     'Jarak Tempuh',
                                //     style: AppTextStyles.secoundaryTextNormal
                                //         .copyWith(
                                //       color: Colors.grey.shade600,
                                //       fontSize: 12,
                                //     ),
                                //   ),
                                // ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    textAlign: TextAlign
                                        .start, // Menyelaraskan teks ke kanan
                                   '${target == TargetOfKunjugan.anakStunting ? 'Anak Stunting' : target == TargetOfKunjugan.anakTidakHadir ? 'Anak Tidak Hadir' : 'Ibu Hamil'}',
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
    
      // ! anak stunting sedang berjalan
    if (status == Status.berjalan &&
        target == TargetOfKunjugan.anakStunting) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_STUNTING_ON_GOING);
      logger.d("Navigasi ke halaman untuk Anak Stunting yang sedang berjalan");

      // ! anak tidak hadir sedang berjalan
    } else if (status == Status.berjalan &&
        target == TargetOfKunjugan.anakTidakHadir) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_ON_GOING);
      logger
          .d("Navigasi ke halaman untuk Anak Tidak Hadir yang sedang berjalan");

      // ! ibu hamil sedang berjalan
    } else if (status == Status.berjalan &&
        target == TargetOfKunjugan.ibuHamil) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_IBU_HAMIL_ON_GOING);
      logger.d("Navigasi ke halaman untuk Ibu Hamil yang sedang berjalan");

      // ! anak stunting selesai
    } else if (status == Status.selesai &&
        target == TargetOfKunjugan.anakStunting) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_STUNTING_DONE);
      logger.d("Navigasi ke halaman untuk Anak Stunting yang sudah selesai");

      // ! anak tidak hadir selesai
    } else if (status == Status.selesai &&
        target == TargetOfKunjugan.anakTidakHadir) {
      Navigator.pushNamed(context, DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_DONE);
      logger.d("Navigasi ke halaman untuk Anak Tidak Hadir yang sudah selesai");

      //! ibu hamil selesai
    } else if (status == Status.selesai &&
        target == TargetOfKunjugan.ibuHamil) {
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
