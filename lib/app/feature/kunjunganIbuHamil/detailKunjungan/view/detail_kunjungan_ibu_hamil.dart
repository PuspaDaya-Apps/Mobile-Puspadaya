import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
import '../bloc/deleteKunjunganIbuHamilBloc/delete_kunjungan_ibu_hamil_bloc.dart';
import '../bloc/detailKunjunganIbuHamilBloc/detail_kunjungan_ibu_hamil_bloc.dart';

class DetailKunjunganIbuHamil extends StatelessWidget {
  const DetailKunjunganIbuHamil({super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DetailKunjunganIbuHamilBloc(),
          ),
          BlocProvider(
            create: (context) => DeleteKunjunganIbuHamilBloc(),
          ),
        ],
        child: DetailKunjunganIbuHamilScreen(
          idKunjungan: idKunjungan,
        ));
  }
}

class DetailKunjunganIbuHamilScreen extends StatefulWidget {
  const DetailKunjunganIbuHamilScreen({super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  State<DetailKunjunganIbuHamilScreen> createState() =>
      _DetailKunjunganIbuHamilScreenState();
}

class _DetailKunjunganIbuHamilScreenState
    extends State<DetailKunjunganIbuHamilScreen> {
  List<String> job = [
    "Pemberian Makanan Tambahan",
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
    BlocProvider.of<DetailKunjunganIbuHamilBloc>(context)
        .add(GetDetailKunjunganIbuHamil(widget.idKunjungan));
  }

  @override
  Widget build(BuildContext context) {
    final deleteKunjunganBloc = BlocProvider.of<DeleteKunjunganIbuHamilBloc>(context);

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
          child: BlocConsumer<DetailKunjunganIbuHamilBloc, DetailKunjunganIbuHamilState>(
            listener: (context, state) {
              debugPrint(state.toString());
            },
            builder: (context, state) {
              if(state is DetailKunjunganIbuHamilProccessState) {
                return Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).height,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: bluePrimaryMain,
                  ),
                );
              }
              if(state is DetailKunjunganIbuHamilSuccessState) {
                return Container(
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
                      InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.nik),
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
                      InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.namaIbu),
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
                                InfoFieldWidget(text: DateFormat("HH:mm", "ID_id").format(state.listDataIbuHamil.mulaiPada)),
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
                                InfoFieldWidget(text: DateFormat("HH:mm", "ID_id").format(state.listDataIbuHamil.selesaiPada)),
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
                      InfoFieldWidget(text: formattedTime(state.listDataIbuHamil.selesaiPada.difference(state.listDataIbuHamil.mulaiPada).inSeconds)),
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
                      InfoFieldWidget(text: state.listDataIbuHamil.jarakTotal),
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
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.dusun.desaKelurahan.kecamatan.kabupatenKota.namaKabupatenKota),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.dusun.desaKelurahan.kecamatan.namaKecamatan),
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
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.dusun.desaKelurahan.namaDesaKelurahan),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.dusun.namaDusun),
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
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.rt),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.listDataIbuHamil.ibuHamil!.ibuAnak.rw),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                        text: state.listDataIbuHamil.ibuHamil!.ibuAnak.alamat,
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
                        children: state.listDataIbuHamil.kunjunganTugasKader.map(
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
                                  imageUrls: state.listDataIbuHamil.buktiKunjungan.map((e) => e.filePath).toList(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      state.listDataIbuHamil.selesaiPada.difference(DateTime.now()).inDays == 0
                      ? ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () {
                          Navigator.pushNamed(context, UPDATE_IBU_HAMIL_KUNJUNGAN, arguments: state.listDataIbuHamil).then((value) {
                            if(value != null) {
                              BlocProvider.of<DetailKunjunganIbuHamilBloc>(context).add(GetDetailKunjunganIbuHamil(widget.idKunjungan));
                            }
                          });
                        },
                      )
                      : const SizedBox(),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(20),
                      ),
                      BlocConsumer<DeleteKunjunganIbuHamilBloc, DeleteKunjunganIbuHamilState>(
                        listener: (context, state) {
                          debugPrint(state.toString());
                          if(state is DeleteKunjunganIbuHamilSuccessState) {
                            Navigator.pop(context);
                            Navigator.pop(context,1);
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
                                    message: 'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                    mainButton: () {
                                      deleteKunjunganBloc.add(DeleteKunjungan(state.listDataIbuHamil.id));
                                    },
                                    image: imageDeleteItems,
                                    mainButtonMessage: 'Iya, Hapus  Kunjungan',
                                    colorMainButton: redPrimaryMain,
                                    cancelButton: () {
                                      Navigator.pop(context);
                                    },
                                    cancelButtonMessage: 'Batalkan',
                                    loadingState: stateDelete is DeleteKunjunganIbuHamilProccessState ? true : null,
                                  );
                                },
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                );
              }
              return Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).height,
                alignment: Alignment.center,
                child: const ErrorServerScreen()
              );
            },
          ),
        ),
      ),
    );
  }
}
