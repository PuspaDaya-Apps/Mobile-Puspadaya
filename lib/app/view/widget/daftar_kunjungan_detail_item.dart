import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../config/theme/shadow.dart';
import '../../model/detailListKunjungan_model.dart';

class DaftarKunjunganDetailItem extends StatelessWidget {
  final DetailListkunjunganModel detailKunjungan;
  final Status status;
  final VoidCallback onTap;

  const DaftarKunjunganDetailItem({
    super.key,
    required this.onTap,
    required this.detailKunjungan,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: boxShadow(),
      ),
      child: ListTile(
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
                  color: status == Status.belumDiMulai
                      ? greenPrimaryMain
                      : status == Status.berjalan
                          ? goldPrimaryMain
                          : bluePrimaryMain,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${detailKunjungan.name}',
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
                                text: '${detailKunjungan.nik}',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Status : ${detailKunjungan.status == Status.belumDiMulai ? 'Belum Dimulai' : detailKunjungan.status == Status.berjalan ? 'Berjalan' : 'Selesai'}',
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
                        spacing: 4,
                        children: [
                          Text(
                            'Jarak',
                            style: AppTextStyles.secoundaryTextNormal.copyWith(
                              fontSize: 8,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${detailKunjungan.distance}',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 24,
                                  ),
                                ),
                                TextSpan(
                                  text: 'KM',
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
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
      ),
    );
  }
}
