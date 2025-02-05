import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/model/get_orangtua_detail_response.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../view/widget/info_field_widget.dart';

class DetailDataAyah extends StatelessWidget {
  final GetOrangtuaDetailResponse getOrangtuaDetailResponse;
  DetailDataAyah({super.key, required this.getOrangtuaDetailResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nomor Kartu Keluarga',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.kartuKeluarga}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'NIK',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${getOrangtuaDetailResponse.data.ayah.nik}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nama Ayah',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.namaAyah}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Tempat Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              '${getOrangtuaDetailResponse.data.ayah.tempatLahir}'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              '${HelperCore.convertformatDateToIndonesian(getOrangtuaDetailResponse.data.ayah.tanggalLahir)}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ayah.dusun.desaKelurahan.kecamatan.kabupaten.provinsi.namaProvinsi}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ayah.dusun.desaKelurahan.kecamatan.kabupaten.namaKabupaten}'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ayah.dusun.desaKelurahan.kecamatan.namaKecamatan}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ayah.dusun.desaKelurahan.namaDesaKelurahan}'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.dusun.namaDusun}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: InfoFieldWidget(
                      text: '${getOrangtuaDetailResponse.data.ayah.rt}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text: '${getOrangtuaDetailResponse.data.ayah.rw}'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.alamat}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nomor Telepon',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.nomorTelepon}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Golongan Darah',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ayah.golDarah}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            getOrangtuaDetailResponse.data.ayah.jenisDisabilitas != null &&
                    getOrangtuaDetailResponse
                        .data.ayah.jenisDisabilitas!.isNotEmpty
                ? ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    title: Text(
                      'Disabilitas',
                      style: AppTextStyles.primaryTextMedium.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    children: [
                      ...getOrangtuaDetailResponse.data.ayah.jenisDisabilitas!
                          .map(
                        (e) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 4),
                              child: Text(
                                e.namaDisabilitas, // Mengakses nama disabilitas
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(), // Pastikan untuk mengonversi ke list
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              color: goldPrimaryMain,
              mainButtonMessage: 'Perbarui',
              mainButton: () {
                Navigator.pushNamed(context, UPDATE_REGISTER_ORANG_TUA);
              },
            ),
          ],
        ),
      ),
    );
  }
}
