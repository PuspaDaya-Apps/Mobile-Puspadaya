import 'package:flutter/material.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../model/get_orangtua_detail_response.dart';

class DetailDataIbu extends StatelessWidget {
  final GetOrangtuaDetailResponseModel getOrangtuaDetailResponse;
  final List<String> disabilitas = [
    'Tunanetra',
  ];
  DetailDataIbu({super.key, required this.getOrangtuaDetailResponse});

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
                text:
                    '${getOrangtuaDetailResponse.data.ibu.kartuKeluarga.nomorKartuKeluarga}'),
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
            InfoFieldWidget(text: '${getOrangtuaDetailResponse.data.ibu.nik}'),
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
            InfoFieldWidget(text: '${getOrangtuaDetailResponse.data.ibu.nama}'),
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
                              '${getOrangtuaDetailResponse.data.ibu.tempatLahir}'),
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
                              '${HelperCore.convertformatDateToIndonesian(getOrangtuaDetailResponse.data.ibu.tanggalLahir)}'),
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
                          '${getOrangtuaDetailResponse.data.ibu.dusun.desaKelurahan.kecamatan.kabupaten.provinsi.namaProvinsi}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ibu.dusun.desaKelurahan.kecamatan.kabupaten.namaKabupaten}'),
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
                          '${getOrangtuaDetailResponse.data.ibu.dusun.desaKelurahan.kecamatan.namaKecamatan}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text:
                          '${getOrangtuaDetailResponse.data.ibu.dusun.desaKelurahan.namaDesaKelurahan}'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ibu.dusun.namaDusun}'),
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
                      text: '${getOrangtuaDetailResponse.data.ibu.rt}'),
                ),
                Expanded(
                  child: InfoFieldWidget(
                      text: '${getOrangtuaDetailResponse.data.ibu.rw}'),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: '${getOrangtuaDetailResponse.data.ibu.alamat}'),
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
                text: '${getOrangtuaDetailResponse.data.ibu.nomorTelepon}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Jenis KB',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              '${getOrangtuaDetailResponse.data.ibu.jenisKB}'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                          text:
                              '${getOrangtuaDetailResponse.data.ibu.golDarah}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Tanggal kelahiran anak sebelumnya',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text:
                    '${getOrangtuaDetailResponse.data.ibu.tanggalMelahirkanSebelumnya}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Jumlah Anak',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
              text: '${getOrangtuaDetailResponse.data.ibu.jumlahAnak}',
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            getOrangtuaDetailResponse.data.ibu.jenisDisabilitas != null &&
                    getOrangtuaDetailResponse
                        .data.ibu.jenisDisabilitas!.isNotEmpty
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
                      ...getOrangtuaDetailResponse.data.ibu.jenisDisabilitas!
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
            ButtonPrimary(
              color: goldPrimaryMain,
              mainButtonMessage: 'Perbarui',
              mainButton: () {
                Navigator.pushNamed(context, UPDATE_REGISTER_ORANG_TUA,
                    arguments: getOrangtuaDetailResponse.data.ayah.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
