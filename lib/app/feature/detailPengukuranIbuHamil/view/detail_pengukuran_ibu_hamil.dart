import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DetailPengukuranIbuHamil extends StatelessWidget {
  const DetailPengukuranIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPengukuranIbuHamilView();
  }
}

class DetailPengukuranIbuHamilView extends StatefulWidget {
  const DetailPengukuranIbuHamilView({super.key});

  @override
  State<DetailPengukuranIbuHamilView> createState() =>
      _DetailPengukuranIbuHamilViewState();
}

class _DetailPengukuranIbuHamilViewState
    extends State<DetailPengukuranIbuHamilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
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
                InfoFieldWidget(text: '354635284658310023'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nama Ibu Hamil',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Siti Aisyah'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Usia Ibu Hamil',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '32 Tahun'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Usia Kehamilan',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '8 Bulan'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tempat Pengukuran',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Posyandu'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Pengukuran',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '18/09/2024'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Badan',
                            unit: 'cm',
                            tool: 'Microtoise',
                            value: '158',
                          ),
                          InfoFieldMeasuringWidget(
                            title: 'Lengkar Lingan Atas',
                            unit: 'cm',
                            tool: 'Pita Lila',
                            value: '18.8',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Berat Badan',
                            unit: 'kg',
                            tool: 'Timbangan digital',
                            value: '54.9',
                          ),
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Fundus Uteri',
                            unit: 'cm',
                            tool: 'Metline',
                            value: '50.8',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Hemogoblin',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: '14'),
                    ),
                    Text(
                      'g/dl',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Pertama Haid',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '30/05/2024'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Tanggal Terakhir Haid',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '30/06/2024'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 8,
                        children: [
                          const Text(
                            'Terpapar Asap Rokok',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(text: 'Iya'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Tablet Fe',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(text: '2'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                          color: goldPrimaryMain,
                          mainButtonMessage: 'Perharui',
                          mainButton: () {}),
                    ),
                    Expanded(
                      child: ButtonPrimary(
                          color: redPrimaryMain,
                          mainButtonMessage: 'Hapus',
                          mainButton: () {}),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
