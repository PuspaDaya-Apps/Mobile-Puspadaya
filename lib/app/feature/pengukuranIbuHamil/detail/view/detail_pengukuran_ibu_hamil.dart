import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../../monitoring/model/riwayat_monitoring_ibu_hamil_model.dart';
import '../bloc/deletePengukuranIbuHamilBloc/delete_pengukuran_ibu_hamil_bloc.dart';
import '../bloc/detailPengukuranIbuHamilBloc/detail_pengukuran_ibu_hamil_bloc.dart';

class DetailPengukuranIbuHamil extends StatelessWidget {
  final String pengukuranId;
  const DetailPengukuranIbuHamil({super.key, required this.pengukuranId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailPengukuranIbuHamilBloc(),
        ),
        BlocProvider(
          create: (context) => DeletePengukuranIbuHamilBloc(),
        ),
      ],
      child: DetailPengukuranIbuHamilView(
        pengukuranId: pengukuranId,
      ),
    );
  }
}

class DetailPengukuranIbuHamilView extends StatefulWidget {
  final String pengukuranId;
  const DetailPengukuranIbuHamilView({super.key, required this.pengukuranId});

  @override
  State<DetailPengukuranIbuHamilView> createState() =>
      _DetailPengukuranIbuHamilViewState();
}

class _DetailPengukuranIbuHamilViewState
    extends State<DetailPengukuranIbuHamilView> {
  @override
  void initState() {
    BlocProvider.of<DetailPengukuranIbuHamilBloc>(context)
        .add(GetDetailPengukuranIbuHamil(widget.pengukuranId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailPengukuranIbuHamilBloc =
        BlocProvider.of<DetailPengukuranIbuHamilBloc>(context);
    final deletePengukuranIbuHamilBloc =
        BlocProvider.of<DeletePengukuranIbuHamilBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Ibu Hamil',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<DetailPengukuranIbuHamilBloc,
              DetailPengukuranIbuHamilState>(
            listener: (context, state) {
              debugPrint(state.toString());
              if (state is DetailPengukuranIbuHamilFailedState) {
                showTopSnackBar(
                    Overlay.of(context),
                    animationDuration: const Duration(milliseconds: 600),
                    displayDuration: const Duration(milliseconds: 2200),
                    reverseAnimationDuration: const Duration(milliseconds: 300),
                    TopSnackbarWidget().error(state.error));
              }
            },
            builder: (context, state) {
              if (state is DetailPengukuranIbuHamilProcessState) {
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
              if (state is DetailPengukuranIbuHamilSuccesState) {
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
                          text: state.detailPengukuranIbuHamilResponseModel
                              .data!.ibuHamil.nama),
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
                      InfoFieldWidget(
                          text: state.detailPengukuranIbuHamilResponseModel
                              .data!.ibuHamil.nik),
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
                      InfoFieldWidget(
                          text: state.detailPengukuranIbuHamilResponseModel
                              .data!.usiaIbuHamil),
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
                      InfoFieldWidget(
                          text: state.detailPengukuranIbuHamilResponseModel
                              .data!.usiaKehamilan),
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
                      InfoFieldWidget(
                          text: state.detailPengukuranIbuHamilResponseModel
                              .data!.tempatPengukuran),
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
                      InfoFieldWidget(
                          text: DateFormat('d MMMM y', 'ID_id').format(state
                              .detailPengukuranIbuHamilResponseModel
                              .data!
                              .tanggalPengukuran)),
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
                                  tool: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .alatTinggiBadan
                                      .jenisAlat,
                                  value: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .tinggiBadan,
                                ),
                                InfoFieldMeasuringWidget(
                                  title: 'Lingkar Lengan Atas',
                                  unit: 'cm',
                                  tool: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .alatLingkarLengan
                                      .jenisAlat,
                                  value: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .lingkarLenganAtas,
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
                                  tool: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .alatBeratBadan
                                      .jenisAlat,
                                  value: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .beratBadan,
                                ),
                                InfoFieldMeasuringWidget(
                                  title: 'Tinggi Fundus Uteri',
                                  unit: 'cm',
                                  tool: state
                                      .detailPengukuranIbuHamilResponseModel
                                      .data!
                                      .alatTinggiFundus
                                      .jenisAlat,
                                  value: state
                                          .detailPengukuranIbuHamilResponseModel
                                          .data!
                                          .tinggiFundusUteri ??
                                      "-",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Hemoglobin',
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
                            child: InfoFieldWidget(
                                text: state
                                        .detailPengukuranIbuHamilResponseModel
                                        .data!
                                        .hemoglobin ??
                                    "-"),
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
                      InfoFieldWidget(
                          text: DateFormat('d MMMM y', 'ID_id').format(state
                              .detailPengukuranIbuHamilResponseModel
                              .data!
                              .ibuHamil
                              .tanggalPertamaHaid)),
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
                      InfoFieldWidget(
                          text: state
                              .detailPengukuranIbuHamilResponseModel
                              .data!
                              .ibuHamil
                              .tanggalTerakhirHaid != "-"
                      ? DateFormat('d MMMM y', 'ID_id').format(state
                              .detailPengukuranIbuHamilResponseModel
                              .data!
                              .ibuHamil
                              .tanggalTerakhirHaid)
                      : state
                              .detailPengukuranIbuHamilResponseModel
                              .data!
                              .ibuHamil
                              .tanggalTerakhirHaid),
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
                                InfoFieldWidget(
                                    text: state
                                        .detailPengukuranIbuHamilResponseModel
                                        .data!
                                        .terpaparAsapRokok),
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
                                InfoFieldWidget(
                                    text: state
                                        .detailPengukuranIbuHamilResponseModel
                                        .data!
                                        .jumlahTabletFe
                                        .toString()),
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
                              mainButtonMessage: 'Perbarui',
                              mainButton: () {
                                Navigator.pushNamed(
                                        context, UPDATE_PENGUKURAN_IBU_HAMIL,
                                        arguments: state
                                            .detailPengukuranIbuHamilResponseModel)
                                    .then((value) {
                                  if (value != null) {
                                    detailPengukuranIbuHamilBloc.add(
                                        GetDetailPengukuranIbuHamil(
                                            widget.pengukuranId));
                                  }
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: BlocConsumer<DeletePengukuranIbuHamilBloc,
                                DeletePengukuranIbuHamilState>(
                              listener: (context, state) {
                                debugPrint(state.toString());
                                if (state
                                    is DeletePengukuranIbuHamilSuccessState) {
                                  Navigator.pop(context);
                                  Navigator.pop(context, 1);
                                }
                                if (state
                                    is DeletePengukuranIbuHamilFailedState) {
                                  showTopSnackBar(
                                      Overlay.of(context),
                                      animationDuration:
                                          const Duration(milliseconds: 600),
                                      displayDuration:
                                          const Duration(milliseconds: 2200),
                                      reverseAnimationDuration:
                                          const Duration(milliseconds: 300),
                                      TopSnackbarWidget().error(state.error));
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
                                            deletePengukuranIbuHamilBloc.add(
                                                SendDeletePengukuranIbuHamil(
                                                    widget.pengukuranId));
                                          },
                                          image: imageDeleteItems,
                                          mainButtonMessage:
                                              'Iya, Hapus Pengukuran',
                                          colorMainButton: redPrimaryMain,
                                          loadingState: stateDelete
                                                  is DeletePengukuranIbuHamilProccesState
                                              ? true
                                              : null,
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
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    ],
                  ),
                );
              }
              return SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: const ErrorServerScreen());
            },
          ),
        ),
      ),
    );
  }
}
