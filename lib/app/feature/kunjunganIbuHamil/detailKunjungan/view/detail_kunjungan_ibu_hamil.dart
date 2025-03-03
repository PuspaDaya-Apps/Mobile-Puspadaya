import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/screen/bukti_kunjungan.dart';

<<<<<<< HEAD:lib/app/feature/detailKunjunganSelesai/view/detail_kunjungan_selesai_ibu_hamil.dart
class DetailKunjunganSelesaiIbuHamil extends StatelessWidget {
  final List<String> job = [
=======
class DetailKunjunganIbuHamil extends StatelessWidget {
  List<String> job = [
>>>>>>> cd980ca3d5d7db318f2c78badfc123a93c80af65:lib/app/feature/kunjunganIbuHamil/detailKunjungan/view/detail_kunjungan_ibu_hamil.dart
    "Pemberian Makanan Tambahan",
  ];
  DetailKunjunganIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        background: Colors.white,
        title: 'Detail Kunjungan Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
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
                InfoFieldWidget(text: '3621550192732625'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Clara Pratiwi'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mulai',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(text: '08.20'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selesai',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(text: '13.15'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Lama Waktu Kunjung',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '4 Menit 20 Detik'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Jarak Tempuh',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '3,0 KM'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  textAlign: TextAlign.start,
                  'Alamat',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: 'Banyuwangi'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Kabat'),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: 'Kabat'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Bunder'),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: '11'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: '03'),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(
                  text: 'Jl. Jendaral Sudirman, Gg. Jembatan Ayu',
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Daftar Tugas Yang Dilakukan',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  children: job
                      .map(
                        (task) => Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 5,
                              left: 3,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              task,
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(20),
                ),
                ButtonPrimary(
                  color: bluePrimaryMain,
                  mainButtonMessage: 'Bukti Kunjungan',
                  mainButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BuktiKunjungan(
                            imageUrls: [imageBuktiIbuHamil],
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
