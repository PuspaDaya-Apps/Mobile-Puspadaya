import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/alert_dialog_widget.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../bloc/detail_anggota_kader_bloc.dart';

class DetailRegisterAnggotaKader extends StatelessWidget {
  const DetailRegisterAnggotaKader({super.key, required this.anggotakaderId});

  final String anggotakaderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailAnggotaKaderBloc(),
      child: DetailRegisterAnggotaKaderView(anggotakaderId: anggotakaderId),
    );
  }
}

class DetailRegisterAnggotaKaderView extends StatefulWidget {
  const DetailRegisterAnggotaKaderView(
      {super.key, required this.anggotakaderId});

  final String anggotakaderId;

  @override
  State<DetailRegisterAnggotaKaderView> createState() =>
      _DetailRegisterAnggotaKaderViewState();
}

class _DetailRegisterAnggotaKaderViewState
    extends State<DetailRegisterAnggotaKaderView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailAnggotaKaderBloc>(context)
        .add(GetDetailAnggotaKader(widget.anggotakaderId));
  }

  @override
  Widget build(BuildContext context) {
    final detailAnggotaKaderBloc = BlocProvider.of<DetailAnggotaKaderBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Anggota Kader',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<DetailAnggotaKaderBloc, DetailAnggotaKaderState>(
          listener: (context, state) {
            debugPrint(state. toString());
          },
          builder: (context, state) {
            if(state is DetailAnggotaKaderProcessState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: bluePrimaryMain,
                ),
              );
            }
            if(state is DetailAnggotaKaderSuccesState) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
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
                        child: ClipOval(
                          child: Image(
                            width: 100,
                            height: 100,
                            image: AssetImage(
                              userImageDefault,
                            ),
                            fit: BoxFit
                                .cover, // Mengatur agar gambar mengisi area lingkaran
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.namaLengkap),
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
                      InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.nomorTelepon),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.tanggalLahir),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      const Text(
                        'Posyandu',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.posyandu.namaPosyandu),
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
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.dusun.desaKelurahan.kecamatan.kabupatenKota.namaKabupatenKota),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.dusun.desaKelurahan.kecamatan.namaKecamatan),
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
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.dusun.desaKelurahan.namaDesaKelurahan),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.dusun.namaDusun),
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
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.rt),
                          ),
                          Expanded(
                            child: InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.rw),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: state.detailAnggotaKaderResponseModel.data!.alamatLengkap),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () {
                          Navigator.pushNamed(
                            context, 
                            UPDATE_REGISTER_ANGGOTA_KADER,
                            arguments: widget.anggotakaderId
                          ).then((value) {
                            if(value != null) {
                              detailAnggotaKaderBloc.add(GetDetailAnggotaKader(widget.anggotakaderId));
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      ButtonPrimary(
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
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                image: imageDeleteItems,
                                mainButtonMessage: 'Iya, Hapus Anggoa Kader',
                                colorMainButton: redPrimaryMain,
                                cancelButton: () {
                                  Navigator.pop(context);
                                },
                                cancelButtonMessage: 'Batalkan',
                              );
                            },
                          );
                        },
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
