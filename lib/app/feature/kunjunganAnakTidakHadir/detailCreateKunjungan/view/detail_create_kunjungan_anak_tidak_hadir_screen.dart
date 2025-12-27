import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/kunjunganAnakTidakHadir/formTugasKunjungan/view/form_tugas_kunjungan_anak_tidak_hadir_screen.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../bloc/detailCreateKunjunganAnakTidakHadirBloc/detail_create_kunjungan_anak_tidak_hadir_bloc.dart';

class DetailCreateKunjunganAnakTidakHadir extends StatelessWidget {
  const DetailCreateKunjunganAnakTidakHadir(
      {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCreateKunjunganAnakTidakHadirBloc(),
      child: DetailCreateKunjunganAnakTidakHadirView(idKunjungan: idKunjungan),
    );
  }
}

class DetailCreateKunjunganAnakTidakHadirView extends StatefulWidget {
  const DetailCreateKunjunganAnakTidakHadirView(
      {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  State<DetailCreateKunjunganAnakTidakHadirView> createState() =>
      _DetailCreateKunjunganAnakTidakHadirViewState();
}

class _DetailCreateKunjunganAnakTidakHadirViewState
    extends State<DetailCreateKunjunganAnakTidakHadirView> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  // Format waktu menjadi MM:SS
  String get formattedTime {
    // int minutes = _seconds ~/ 60;
    // int seconds = _seconds % 60;

    int h = _seconds ~/ 3600;
    int m = ((_seconds - h * 3600)) ~/ 60;
    int s = _seconds - (h * 3600) - (m * 60);

    if (h != 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    } else {
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailCreateKunjunganAnakTidakHadirBloc>(context)
        .add(GetDetailKunjunganAnak(widget.idKunjungan));
  }

  // Mulai atau hentikan timer
  void _toggleTimer(DateTime mulai) {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds = DateTime.now().difference(mulai).inSeconds;
      });
    });
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
        title: 'Kunjungan Anak Tidak Hadir',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<DetailCreateKunjunganAnakTidakHadirBloc,
            DetailCreateKunjunganAnakTidakHadirState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if (state is DetailCreateKunjunganAnakTidakHadirProccessState) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              );
            }
            if (state is DetailCreateKunjunganAnakTidakHadirSuccessState) {
              if (_isRunning == false) {
                _toggleTimer(state.listDataAnakTidakHadir.mulaiPada);
              }
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Estimasi Jarak",
                                    style: AppTextStyles
                                        .secoundaryTextMedium
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  // SizedBox(
                                  //     width:
                                  //         4), // Tambahkan jarak antar teks jika diperlukan
                                  Text(
                                    "${state.listDataAnakTidakHadir.estimasiJarak} m",
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
                                      fontSize: 28,
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
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start, // Pusatkan elemen di dalam Row
                                children: [
                                  Text(
                                    "Waktu",
                                    style: AppTextStyles.secoundaryTextMedium
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  // SizedBox(
                                  //     width:
                                  //         4), // Tambahkan jarak antar teks jika diperlukan
                                  Text(
                                    formattedTime,
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
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
                      InfoFieldWidget(
                          text: state.listDataAnakTidakHadir.anak!.nik),
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
                      InfoFieldWidget(
                          text: state.listDataAnakTidakHadir.anak!.namaAnak),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      state.listDataAnakTidakHadir.anak!.kartuKeluarga.ibu !=
                              null
                          ? Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    textAlign: TextAlign.start,
                                    'Alamat',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8),
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Expanded(
                                      child: InfoFieldWidget(
                                          text: state
                                              .listDataAnakTidakHadir
                                              .anak!
                                              .kartuKeluarga
                                              .ibu!
                                              .dusun
                                              .desaKelurahan
                                              .kecamatan
                                              .kabupatenKota
                                              .namaKabupatenKota),
                                    ),
                                    Expanded(
                                      child: InfoFieldWidget(
                                          text: state
                                              .listDataAnakTidakHadir
                                              .anak!
                                              .kartuKeluarga
                                              .ibu!
                                              .dusun
                                              .desaKelurahan
                                              .kecamatan
                                              .namaKecamatan),
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
                                      child: InfoFieldWidget(
                                          text: state
                                              .listDataAnakTidakHadir
                                              .anak!
                                              .kartuKeluarga
                                              .ibu!
                                              .dusun
                                              .desaKelurahan
                                              .namaDesaKelurahan),
                                    ),
                                    Expanded(
                                      child: InfoFieldWidget(
                                          text: state
                                              .listDataAnakTidakHadir
                                              .anak!
                                              .kartuKeluarga
                                              .ibu!
                                              .dusun
                                              .namaDusun),
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
                                      child: InfoFieldWidget(
                                          text: state.listDataAnakTidakHadir
                                              .anak!.kartuKeluarga.ibu!.rt),
                                    ),
                                    Expanded(
                                      child: InfoFieldWidget(
                                          text: state.listDataAnakTidakHadir
                                              .anak!.kartuKeluarga.ibu!.rw),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8),
                                ),
                                InfoFieldWidget(
                                  text: state.listDataAnakTidakHadir.anak!
                                      .kartuKeluarga.ibu!.alamat,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      ButtonPrimary(
                        color: bluePrimaryMain, // Warna tombol
                        mainButtonMessage: 'Selesai', // Teks tombol
                        mainButton: () {
                          Navigator.pushNamed(
                              context, FORM_TUGAS_ANAK_TIDAK_HADIR_KUNJUNGAN,
                              arguments: state.listDataAnakTidakHadir.id);
                        }, // Jalankan timer
                      ),
                    ],
                  ),
                ),
              );
            }
            return const ErrorServerScreen();
          },
        ),
      ),
    );
  }
}
