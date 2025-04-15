import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../bloc/detail_register_anak_bloc.dart';
import '../model/get_detail_anak_response.dart';
import 'detail_data_wali.dart';

class DetailDataAnak extends StatelessWidget {
  final DetailRegisterAnakBloc detailRegisterAnakBloc;
  final String anakId;
  final GetDetailAnakResponse detailResponse;
  // final List<String> disabilitas = [
  //   'Tunanetra',
  // ];
  DetailDataAnak({
    super.key, 
    required this.detailResponse,
    required this.detailRegisterAnakBloc,
    required this.anakId
  });

  @override
  Widget build(BuildContext context) {
    bool hasDisabilities = (detailResponse.data!.disabilitasAnak != null &&
            detailResponse.data!.disabilitasAnak!.isNotEmpty);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'NIK',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.nik}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Nama',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.namaAnak}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Anak ke',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.anakKe.toString()}'),
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
                          text: '${detailResponse.data!.tempatLahir}'),
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
                          text: '${detailResponse.data!.tanggalLahir}'),
                    ],
                  ),
                ),
              ],
            ),
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
                        'Tinggi Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: '${detailResponse.data!.tinggiBadanLahir} CM'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Berat Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: '${detailResponse.data!.beratBadanLahir} KG'),
                    ],
                  ),
                ),
              ],
            ),
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
                        'Lingkar Lengan',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              '${detailResponse.data!.lingkarLenganAtasLahir} CM'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Lingkar Kepala',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              '${detailResponse.data!.lingkarKepalaLahir} CM'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.jenisKelamin}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Cara Lahir',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.caraLahir}'),
             SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Jarak Posyandu',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.jarakPosyandu} Meter'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Status Kelahiran',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.statusKelahiran}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Status Orang Tua Anak',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(text: '${detailResponse.data!.statusOrangTua}'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            hasDisabilities
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
                      // If there are disabilities from detailResponse
                      if (detailResponse.data!.disabilitasAnak != null &&
                          detailResponse.data!.disabilitasAnak!.isNotEmpty)
                        ...detailResponse.data!.disabilitasAnak!.map((e) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 4),
                              child: Text(
                                e.namaDisabilitas!, // Accessing the name of the disability
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }).toList(),

                      // If there are disabilities from the disabilitas list
                      // if (disabilitas != null && disabilitas.isNotEmpty)
                      //   ...disabilitas.map((e) {
                      //     return Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Padding(
                      //         padding: EdgeInsets.only(left: 4, bottom: 4),
                      //         child: Text(
                      //           e,
                      //           style: AppTextStyles.primaryTextMedium.copyWith(
                      //             fontSize: 14,
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            detailResponse.data!.pengasuhAnak != null
                ? ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Lihat Data Wali',
                    mainButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailDataWali(),
                        ),
                      );
                    },
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              color: goldPrimaryMain,
              mainButtonMessage: 'Perbarui',
              mainButton: () {
                Navigator.pushNamed(context, UPDATE_REGISTER_ANAK, arguments: detailResponse).then((value) {
                  if(value != null) {
                    detailRegisterAnakBloc.add(FeathingDetailRegisterAnak(anakId: anakId));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
