import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createKunjunganStunting/view/checklist_job_kunjungan_anak.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class TimerKunjunganStunting extends StatefulWidget {
  const TimerKunjunganStunting({super.key});

  @override
  State<TimerKunjunganStunting> createState() => _TimerKunjunganStuntingState();
}

class _TimerKunjunganStuntingState extends State<TimerKunjunganStunting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Kunjungan Anak Stunting',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    height: 240,
                    image: AssetImage(
                      imageOnTheWay,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment
                            .center, // Pusatkan konten di dalam Container
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Pusatkan elemen di dalam Row
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Jarak",
                                  style: AppTextStyles.secoundaryTextMedium
                                      .copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        4), // Tambahkan jarak antar teks jika diperlukan
                                Text(
                                  "2.5",
                                  style:
                                      AppTextStyles.primaryTextMedium.copyWith(
                                    fontSize: 28,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                width:
                                    4), // Tambahkan jarak antar teks jika diperlukan
                            Text(
                              "KM",
                              style:
                                  AppTextStyles.secoundaryTextMedium.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 38,
                      color: Colors.black54,
                      width: 2,
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Pusatkan elemen di dalam Row
                          children: [
                            Text(
                              "Waktu",
                              style:
                                  AppTextStyles.secoundaryTextMedium.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                                width:
                                    4), // Tambahkan jarak antar teks jika diperlukan
                            Text(
                              "00.00",
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 16,
                ),
                const Text(
                  textAlign: TextAlign.start,
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
                  textAlign: TextAlign.start,
                  'Nama Anak',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Aisyah Zahra Putri'),
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
                  height: SizeConfig.calHeightMultiplier(20),
                ),
                ButtonPrimary(
                  color: greenPrimaryMain,
                  mainButtonMessage: 'Mulai',
                  mainButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChecklistJobKunjunganAnak();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
