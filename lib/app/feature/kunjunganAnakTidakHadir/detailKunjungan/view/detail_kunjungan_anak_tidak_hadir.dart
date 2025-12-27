import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/screen/bukti_kunjungan.dart';
import '../../../maps/model/maps_kunjungan_data_model.dart';
import '../bloc/deleteKunjunganAnakTidakHadirBloc/delete_kunjungan_anak_tidak_hadir_bloc.dart';
import '../bloc/detailKunjunganAnakTidakHadirBloc/detail_kunjungan_anak_tidak_hadir_bloc.dart';

class DetailKunjunganAnakTidakHadir extends StatelessWidget {
  const DetailKunjunganAnakTidakHadir({super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailKunjunganAnakTidakHadirBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteKunjunganAnakTidakHadirBloc(),
        ),
      ],
      child: DetailKunjunganAnakTidakHadirScreen(idKunjungan: idKunjungan),
    );
  }
}

class DetailKunjunganAnakTidakHadirScreen extends StatefulWidget {
  const DetailKunjunganAnakTidakHadirScreen(
      {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  State<DetailKunjunganAnakTidakHadirScreen> createState() =>
      _DetailKunjunganAnakTidakHadirScreenState();
}

class _DetailKunjunganAnakTidakHadirScreenState
    extends State<DetailKunjunganAnakTidakHadirScreen> {
  List<String> job = [
    "Vitamin A",
    "obat cacing",
    "stimulasi perkembangan",
  ];

  String formattedTime(int value) {
    // int minutes = _seconds ~/ 60;
    // int seconds = _seconds % 60;

    int h = value ~/ 3600;
    int m = ((value - h * 3600)) ~/ 60;
    int s = value - (h * 3600) - (m * 60);

    if (h != 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    } else {
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailKunjunganAnakTidakHadirBloc>(context)
        .add(GetDetailKunjunganAnak(widget.idKunjungan));
  }

  @override
  Widget build(BuildContext context) {
    final deleteKunjunganBloc =
        BlocProvider.of<DeleteKunjunganAnakTidakHadirBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        background: Colors.white,
        title: 'Detail Kunjungan Anak Tidak Hadir',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<DetailKunjunganAnakTidakHadirBloc,
              DetailKunjunganAnakTidakHadirState>(
            listener: (context, state) {
              debugPrint(state.toString());
            },
            builder: (context, state) {
              if (state is DetailKunjunganAnakTidakHadirProccessState) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.15,
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: 50.0,
                    ),
                  ),
                );
              }
              if (state is DetailKunjunganAnakTidakHadirSuccessState) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                      InfoFieldWidget(
                          text: state.listDataAnakTidakHadir.anak!.nik),
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
                      InfoFieldWidget(
                          text: state.listDataAnakTidakHadir.anak!.namaAnak),
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
                                InfoFieldWidget(
                                    text: DateFormat("HH:mm", "ID_id").format(
                                        state
                                            .listDataAnakTidakHadir.mulaiPada)),
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
                                InfoFieldWidget(
                                    text: DateFormat("HH:mm", "ID_id").format(
                                        state.listDataAnakTidakHadir
                                            .selesaiPada)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Lama Waktu Kunjungan',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: formattedTime(state
                              .listDataAnakTidakHadir.selesaiPada
                              .difference(
                                  state.listDataAnakTidakHadir.mulaiPada)
                              .inSeconds)),
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
                      InfoFieldWidget(text: "${state.listDataAnakTidakHadir.jarakTotal} m"),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      state.listDataAnakTidakHadir.anak!.kartuKeluarga.ibu !=null
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
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                          ],
                        )
                      : const SizedBox(),

                      //Maps 
                      state.listDataAnakTidakHadir.lokasiStart == null && state.listDataAnakTidakHadir.lokasiSelesai  == null
                      ? SizedBox.shrink()
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Lokasi Kunjungan',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context, 
                                  MAPSDETAILKUNJUNGAN,
                                  arguments: MapsKunjunganDataModel(
                                    titikMulai: state.listDataAnakTidakHadir.lokasiStart != null
                                    ? LatLng(
                                      state.listDataAnakTidakHadir.lokasiStart!.latitude, 
                                      state.listDataAnakTidakHadir.lokasiStart!.longitude
                                    )
                                    : null,
                                    titikSelesai: state.listDataAnakTidakHadir.lokasiSelesai != null
                                    ? LatLng(
                                      state.listDataAnakTidakHadir.lokasiSelesai!.latitude, 
                                      state.listDataAnakTidakHadir.lokasiSelesai!.longitude
                                    )
                                    : null
                                  )
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: greenPrimary40,
                                shape: RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(8)
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.calWidthMultiplier(10),
                                  vertical: SizeConfig.calHeightMultiplier(10))),
                              child: Text(
                                'Lihat Lokasi Kunjungan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.calMultiplierText(14),
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(16),
                          ),
                        ],
                      ),

                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: Text(
                          'Daftar Tugas Yang Dilakukan',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        children:
                            state.listDataAnakTidakHadir.kunjunganTugasKader
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
                                        task.tugasKunjungan.namaTugas,
                                        style: AppTextStyles.primaryTextNormal
                                            .copyWith(
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
                                  imageUrls: state
                                      .listDataAnakTidakHadir.buktiKunjungan
                                      .map((e) => e.filePath)
                                      .toList(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      state.listDataAnakTidakHadir.selesaiPada
                                  .difference(DateTime.now())
                                  .inDays ==
                              0
                          ? ButtonPrimary(
                              color: goldPrimaryMain,
                              mainButtonMessage: 'Perbarui',
                              mainButton: () {
                                Navigator.pushNamed(context,
                                        UPDATE_ANAK_TIDAK_HADIR_KUNJUNGAN,
                                        arguments: state.listDataAnakTidakHadir)
                                    .then((value) {
                                  if (value != null) {
                                    BlocProvider.of<
                                                DetailKunjunganAnakTidakHadirBloc>(
                                            context)
                                        .add(GetDetailKunjunganAnak(
                                            widget.idKunjungan));
                                  }
                                });
                              },
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      BlocConsumer<DeleteKunjunganAnakTidakHadirBloc,
                          DeleteKunjunganAnakTidakHadirState>(
                        listener: (context, state) {
                          debugPrint(state.toString());
                          if (state
                              is DeleteKunjunganAnakTidakHadirSuccessState) {
                            Navigator.pop(context);
                            Navigator.pop(context, 1);
                          }
                        },
                        builder: (context, stateDelete) {
                          return ButtonPrimary(
                            color: redPrimaryMain,
                            mainButtonMessage: 'Hapus',
                            mainButton: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialogWidget(
                                    title: 'Apakah Anda Yakin?',
                                    message:
                                        'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                    mainButton: () {
                                      deleteKunjunganBloc.add(DeleteKunjungan(
                                          state.listDataAnakTidakHadir.id));
                                    },
                                    image: imageDeleteItems,
                                    mainButtonMessage: 'Iya, Hapus  Kunjungan',
                                    colorMainButton: redPrimaryMain,
                                    cancelButton: () {
                                      Navigator.pop(context);
                                    },
                                    cancelButtonMessage: 'Batalkan',
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).height,
                  alignment: Alignment.center,
                  child: const ErrorServerScreen());
            },
          ),
        ),
      ),
    );
  }
}
