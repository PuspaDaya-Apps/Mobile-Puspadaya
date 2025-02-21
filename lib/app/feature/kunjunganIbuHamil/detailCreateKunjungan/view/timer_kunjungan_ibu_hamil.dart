import 'dart:async';

import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../view/widget/alert_dialog_widget.dart';
import 'checklist_job_kunjungan_ibu_hamil.dart';

class TimerKunjunganIbuHamil extends StatefulWidget {
  const TimerKunjunganIbuHamil({super.key});

  @override
  State<TimerKunjunganIbuHamil> createState() => _TimerKunjunganIbuHamilState();
}

class _TimerKunjunganIbuHamilState extends State<TimerKunjunganIbuHamil> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  // Format waktu menjadi MM:SS
  String get formattedTime {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Mulai atau hentikan timer
  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      _isRunning = false;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialogWidget(
              image: imageOnTheWay,
              cancelButton: () {
                Navigator.pop(context);
              },
              cancelButtonMessage: 'Kembali ke perjalanan',
              title: 'Apakah Anda Yakin Sudah Menyelesaikan Kunjungan?',
              message:
                  'Anda Sudah Melakukan Perjalanan Sepanjang ${formattedTime}',
              mainButton: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChecklistJobKunjunganIbuHamil(),
                  ),
                );
              },
              mainButtonMessage: 'Iya, Saya Sudah Selesai',
              colorMainButton: bluePrimaryMain);
        },
      );
    } else {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel(); // Pastikan timer dihentikan saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Kunjungan Ibu Hamil',
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
                              formattedTime,
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
                  'Nama Ibu Hamil',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Citra Dewi'),
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
                InfoFieldWidget(text: 'Dadapan'),
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
                  color: _isRunning
                      ? bluePrimaryMain
                      : greenPrimaryMain, // Warna tombol
                  mainButtonMessage:
                      _isRunning ? 'Selesai' : 'Mulai', // Teks tombol
                  mainButton: _toggleTimer, // Jalankan timer
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
