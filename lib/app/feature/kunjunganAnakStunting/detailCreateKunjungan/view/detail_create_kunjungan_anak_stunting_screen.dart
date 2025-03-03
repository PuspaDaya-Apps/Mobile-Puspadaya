import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../view/screen/error_server_screen.dart';
import '../bloc/detailCreateKunjunganAnakStuntingBloc/detail_create_kunjungan_anak_stunting_bloc.dart';

class DetailCreateKunjunganAnakStunting extends StatelessWidget {
  const DetailCreateKunjunganAnakStunting(
      {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCreateKunjunganAnakStuntingBloc(),
      child: DetailCreateKunjunganAnakStuntingView(
        idKunjungan: idKunjungan,
      ),
    );
  }
}

class DetailCreateKunjunganAnakStuntingView extends StatefulWidget {
  const DetailCreateKunjunganAnakStuntingView(
      {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  State<DetailCreateKunjunganAnakStuntingView> createState() =>
      _DetailCreateKunjunganAnakStuntingViewState();
}

class _DetailCreateKunjunganAnakStuntingViewState extends State<DetailCreateKunjunganAnakStuntingView> {
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

    if( h != 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    } else {
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailCreateKunjunganAnakStuntingBloc>(context)
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
        title: 'Kunjungan Anak Stunting',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<DetailCreateKunjunganAnakStuntingBloc, DetailCreateKunjunganAnakStuntingState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if(state is DetailCreateKunjunganAnakStuntingProccessState) {
              return const Center(
                child: CircularProgressIndicator(
                color: bluePrimaryMain,
              ));
            }
            if(state is DetailCreateKunjunganAnakStuntingSuccessState) {
              if(_isRunning == false) {
                _toggleTimer(state.listDataAnakStunting.mulaiPada);
              }
              debugPrint(state.listDataAnakStunting.jarakTotal);
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
                                        
                                        state.listDataAnakStunting.jarakTotal,
                                        style: AppTextStyles.primaryTextMedium
                                            .copyWith(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //     width:
                                  //         4), // Tambahkan jarak antar teks jika diperlukan
                                  // Text(
                                  //   "KM",
                                  //   style: AppTextStyles.secoundaryTextMedium
                                  //       .copyWith(
                                  //     fontSize: 12,
                                  //   ),
                                  // ),
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
                                    style: AppTextStyles.secoundaryTextMedium
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          4), // Tambahkan jarak antar teks jika diperlukan
                                  Text(
                                    formattedTime,
                                    style:
                                        AppTextStyles.primaryTextMedium.copyWith(
                                      fontSize: 22,
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
                      InfoFieldWidget(text: state.listDataAnakStunting.anak!.nik),
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
                      InfoFieldWidget(text: state.listDataAnakStunting.anak!.namaAnak),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      state.listDataAnakStunting.anak!.kartuKeluarga.ibu != null
                      ? Column(
                        children: [
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
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.dusun.desaKelurahan.kecamatan.kabupatenKota.namaKabupatenKota),
                              ),
                              Expanded(
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.dusun.desaKelurahan.kecamatan.namaKecamatan),
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
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.dusun.desaKelurahan.namaDesaKelurahan),
                              ),
                              Expanded(
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.dusun.namaDusun),
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
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.rt),
                              ),
                              Expanded(
                                child: InfoFieldWidget(text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.rw),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(
                            text: state.listDataAnakStunting.anak!.kartuKeluarga.ibu!.alamat,
                          ),
                        ],
                      )
                      : const SizedBox(),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      ButtonPrimary(
                        color: bluePrimaryMain,
                        mainButtonMessage: 'Selesai', // Teks tombol
                        mainButton: () {
                          Navigator.pushNamed(context, FORM_TUGAS_ANAK_STUNTING_KUNJUNGAN, arguments: state.listDataAnakStunting.id);
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
