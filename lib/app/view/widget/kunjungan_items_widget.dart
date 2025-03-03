import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../feature/kunjungan/bloc/index_kunjungan_bloc.dart';
import '../../feature/kunjungan/model/kunjungan_response_model.dart';

class KunjunganItemWidget extends StatelessWidget {
  final Data kunjungan;
  final VoidCallback refresData;

  const KunjunganItemWidget({
    super.key,
    required this.kunjungan,
    required this.refresData
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: refresData,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: shadowSm,
          borderRadius: BorderRadius.circular(12),
          color: kunjungan.statusKunjungan == "Selesai" 
                  ? bluePrimaryMain
                  : goldPrimaryMain,       
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
                          color: kunjungan.statusKunjungan == "Selesai" 
                            ? bluePrimaryMain
                            : goldPrimaryMain,   
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
                        kunjungan.anak != null ? kunjungan.anak!.namaAnak : kunjungan.ibuHamil!.namaIbuHamil,
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
                                DateFormat("d MMMM y").format(kunjungan.tanggalKunjungan),
                                
                                style:
                                    AppTextStyles.secoundaryTextMedium.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 12.5,
                                ),
                              ),
                              Text(
                                 kunjungan.statusKunjungan,
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
                                    kunjungan.jenisKunjungan,
                                    textAlign: TextAlign.start, // Menyelaraskan teks ke kanan
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
}
