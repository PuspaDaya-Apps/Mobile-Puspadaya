import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../model/paketToScreen/paket_to_update_pengukuran_tamu_model.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/info_field_measuring_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../bloc/deletePengukuranTamuBloc/delete_pengukuran_tamu_bloc.dart';
import '../bloc/detailPengukuranTamuBloc/detail_pengukuran_tamu_bloc.dart';
import '../model/detail_pengukuran_tamu_response_model.dart';

class DetailData extends StatefulWidget {
  const DetailData(
      {super.key,
      required this.pengukuranId,
      required this.detailPengukuranTamuResponseModel});
  final String pengukuranId;
  final DetailPengukuranTamuResponseModel detailPengukuranTamuResponseModel;

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    final hapusPengukuranTamuBloc =
        BlocProvider.of<DeletePengukuranTamuBloc>(context);
    final detailPengukuranTamuBloc =
        BlocProvider.of<DetailPengukuranTamuBloc>(context);

    return Container(
      child: SingleChildScrollView(
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
                text: widget.detailPengukuranTamuResponseModel.data!.anak.nik),
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
                text: widget
                    .detailPengukuranTamuResponseModel.data!.anak.namaAnak),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Posyandu Asal',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: widget.detailPengukuranTamuResponseModel.data!.anak.posyanduAsal),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Tanggal',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text: DateFormat("d MMMM y", "ID_id").format(widget
                    .detailPengukuranTamuResponseModel
                    .data!
                    .tanggalPengukuran)),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Posisi Pengukuran Tinggi badan',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
                text:
                    widget.detailPengukuranTamuResponseModel.data!.posisiBadan),
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
                        tool: widget.detailPengukuranTamuResponseModel.data!
                            .alatTinggiBadan.jenisAlat,
                        value: widget.detailPengukuranTamuResponseModel.data!
                            .tinggiBadan,
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lingkar Lengan Atas',
                        unit: 'cm',
                        tool: widget.detailPengukuranTamuResponseModel.data!
                            .alatLingkarLengan.jenisAlat,
                        value: widget.detailPengukuranTamuResponseModel.data!
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
                        tool: widget.detailPengukuranTamuResponseModel.data!
                            .alatBeratBadan.jenisAlat,
                        value: widget
                            .detailPengukuranTamuResponseModel.data!.beratBadan,
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lingkar Kepala',
                        unit: 'cm',
                        tool: widget.detailPengukuranTamuResponseModel.data!
                            .alatLingkarKepala.jenisAlat,
                        value: widget.detailPengukuranTamuResponseModel.data!
                            .lingkarKepala,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Asi Ekslusif',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
              text: widget.detailPengukuranTamuResponseModel.data!.asiEksklusif,
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'MPASI',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            InfoFieldWidget(
              text: widget.detailPengukuranTamuResponseModel.data!.mpasi,
            ),
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
                        'Vitamin A',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                        text: widget.detailPengukuranTamuResponseModel.data!.vitaminA == null || widget.detailPengukuranTamuResponseModel.data!.vitaminA! == false
                        ? 'Tidak'
                        : 'Iya'
                      ),
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
                        'Obat Cacing',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                        text: widget.detailPengukuranTamuResponseModel.data!.obatCacing == null || widget.detailPengukuranTamuResponseModel.data!.obatCacing! == false
                        ? 'Tidak'
                        : 'Iya'
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                        'Status Stunting',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                          text: widget.detailPengukuranTamuResponseModel.data!
                              .statusStunting),
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
                        'Status Underweight',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                          text: widget.detailPengukuranTamuResponseModel.data!
                              .statusGizi),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                const Text(
                  'Status Wasting',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                InfoFieldWidget(
                    text: widget
                        .detailPengukuranTamuResponseModel.data!.statusWasting),
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
                      Navigator.pushNamed(context, UPDATE_PENGUKURAN_TAMU,
                              arguments: PaketToUpdatePengukuranTamuModel(
                                  pengukuranId: widget.pengukuranId,
                                  data:
                                      widget.detailPengukuranTamuResponseModel))
                          .then((value) {
                        if (value != null) {
                          detailPengukuranTamuBloc.add(
                              GetDetailPengukuranTamu(widget.pengukuranId));
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ButtonPrimary(
                    color: redPrimaryMain,
                    mainButtonMessage: 'Hapus',
                    mainButton: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocConsumer<DeletePengukuranTamuBloc, DeletePengukuranTamuState>(
                            bloc: hapusPengukuranTamuBloc,
                            listener: (context, state) {
                              if(state is DeletePengukuranTamuSuccessState) {
                                 Navigator.pop(context);
                                 Navigator.pop(context,1);
                              } 
                              if(state is DeletePengukuranTamuFailedState) {
                                debugPrint(state.error);
                              }
                            },
                            builder: (context, state) {
                              return AlertDialogWidget(
                                title: 'Apakah Anda Yakin?',
                                message: 'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                mainButton: () {
                                  hapusPengukuranTamuBloc.add(SendDeletePengukuranTamu(widget.pengukuranId));
                                },
                                image: imageDeleteItems,
                                mainButtonMessage: 'Iya, Hapus Pengukuran',
                                colorMainButton: redPrimaryMain,
                                cancelButton: () {
                                  Navigator.pop(context);
                                },
                                cancelButtonMessage: 'Batalkan',
                                loadingState: state is DeletePengukuranTamuProccesState ? true : null,
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
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black54,
            ),
            // SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            // Image(
            //   width: MediaQuery.sizeOf(context).width,
            //   image: const AssetImage(imageGrafikPerkembanganAnak),
            // )
          ],
        ),
      ),
    );
  }
}
