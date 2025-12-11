import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../route/route_name.dart';
import '../../../model/paketToScreen/paket_to_update_pengasuh_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../bloc/detail_pengasuh_bloc.dart';

class DetailRegisterPengasuh extends StatelessWidget {
  const DetailRegisterPengasuh({super.key, required this.idPengasuh});

  final String idPengasuh;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailPengasuhBloc(),
      child: DetailRegisterPengasuhView(idPengasuh: idPengasuh),
    );
  }
}

class DetailRegisterPengasuhView extends StatefulWidget {
  const DetailRegisterPengasuhView({super.key, required this.idPengasuh});

  final String idPengasuh;

  @override
  State<DetailRegisterPengasuhView> createState() =>
      _DetailRegisterPengasuhViewState();
}

class _DetailRegisterPengasuhViewState
    extends State<DetailRegisterPengasuhView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailPengasuhBloc>(context)
        .add(GetDetailPengasuh(widget.idPengasuh));
  }

  @override
  Widget build(BuildContext context) {
    final detailPengasuhBloc = BlocProvider.of<DetailPengasuhBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Data Pengasuh',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: BlocConsumer<DetailPengasuhBloc, DetailPengasuhState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if (state is DetailPengasuhProcessState) {
               return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: SpinKitThreeBounce(
                  color: bluePrimaryMain,
                  size: 50.0,
                ),
              ),
            );
            }
            if (state is DetailPengasuhSuccesState) {
              return Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                        'Status Hubungan Dengan Anak',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: state.detailPengasuhResponseModel.data!
                              .statusHubungan),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      const Text(
                        'Nomor Kartu Keluarga',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: state.detailPengasuhResponseModel.data!
                              .kartuKeluarga.nomorKartuKeluarga),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
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
                          text: state.detailPengasuhResponseModel.data!.nik),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
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
                          text: state
                              .detailPengasuhResponseModel.data!.namaPengasuh),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tempat Lahir',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8),
                                ),
                                InfoFieldWidget(
                                    text: state.detailPengasuhResponseModel
                                        .data!.tempatLahir),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tanggal Lahir',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8),
                                ),
                                InfoFieldWidget(
                                  text: DateFormat("d MMMM y", 'ID_id').format(state.detailPengasuhResponseModel.data!.tanggalLahir) 
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                            child: InfoFieldWidget(
                                text: state
                                    .detailPengasuhResponseModel
                                    .data!
                                    .dusun
                                    .desaKelurahan
                                    .kecamatan
                                    .kabupatenKota
                                    .namaKabupatenKota),
                          ),
                          Expanded(
                            child: InfoFieldWidget(
                                text: state
                                    .detailPengasuhResponseModel
                                    .data!
                                    .dusun
                                    .desaKelurahan
                                    .kecamatan
                                    .namaKecamatan),
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
                            child: InfoFieldWidget(
                                text: state.detailPengasuhResponseModel.data!
                                    .dusun.desaKelurahan.namaDesaKelurahan),
                          ),
                          Expanded(
                            child: InfoFieldWidget(
                                text: state.detailPengasuhResponseModel.data!
                                    .dusun.namaDusun),
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
                            child: InfoFieldWidget(
                                text:
                                    state.detailPengasuhResponseModel.data!.rt),
                          ),
                          Expanded(
                            child: InfoFieldWidget(
                                text:
                                    state.detailPengasuhResponseModel.data!.rw),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: state
                              .detailPengasuhResponseModel.data!.alamatLengkap),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      const Text(
                        'Nomor Telepon (WA Aktif)',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text: state.detailPengasuhResponseModel.data!.user
                              .nomorTelepon),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      const Text(
                        'Golongan Darah',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(
                          text:
                              state.detailPengasuhResponseModel.data!.golDarah),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      state.detailPengasuhResponseModel.data!
                              .disabilitasPengasuh.isNotEmpty
                          ? ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: EdgeInsets.zero,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              title: Text(
                                'Disabilitas',
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              children: [
                                ...state.detailPengasuhResponseModel.data!
                                    .disabilitasPengasuh
                                    .map(
                                  (e) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 4, bottom: 4),
                                        child: Text(
                                          e.namaDisabilitas,
                                          style: AppTextStyles.primaryTextMedium
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(16),
                      ),
                      ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () {
                          Navigator.pushNamed(context, UPDATE_REGISTER_PENGASUH,
                                  arguments: PaketToUpdatePengasuhModel(
                                      idPengasuh: widget.idPengasuh,
                                      detailPengasuhResponseModel:
                                          state.detailPengasuhResponseModel))
                              .then((value) {
                            if (value != null) {
                              detailPengasuhBloc
                                  .add(GetDetailPengasuh(widget.idPengasuh));
                            }
                          });
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
