import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/model/paketToScreen/paket_to_update_pengukuran_anak_model.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../bloc/detailPengukuranAnakBloc/detail_pengukuran_anak_bloc.dart';
import '../bloc/hapusPengukuranAnakBloc/hapus_pengukuran_anak_bloc.dart';
import '../model/detail_pengukuran_anak_response_model.dart';

class DetailData extends StatefulWidget {
  const DetailData(
      {super.key,
      required this.pengukuranId,
      required this.detailPengukuranAnakResponseModel});
  final String pengukuranId;
  final DetailPengukuranAnakResponseModel detailPengukuranAnakResponseModel;

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    final hapusPengukuranAnakBloc = BlocProvider.of<HapusPengukuranAnakBloc>(context);
    final detailPengukuranAnakBloc = BlocProvider.of<DetailPengukuranAnakBloc>(context);

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
                text: widget.detailPengukuranAnakResponseModel.data!.anak.nik),
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
                text: widget.detailPengukuranAnakResponseModel.data!.anak.namaAnak),
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
                text: widget
                    .detailPengukuranAnakResponseModel.data!.tempatPengukuran),
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
                text: DateFormat("d MMMM y", 'ID_id').format(widget.detailPengukuranAnakResponseModel.data!.tanggalPengukuran)),
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
                    widget.detailPengukuranAnakResponseModel.data!.posisiBadan),
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
                        tool: widget.detailPengukuranAnakResponseModel.data!.alatTinggiBadan.jenisAlat,
                        value: widget.detailPengukuranAnakResponseModel.data!.tinggiBadan,
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lingkar Lengan Atas',
                        unit: 'cm',
                        tool: widget.detailPengukuranAnakResponseModel.data!.alatLingkarLengan.jenisAlat,
                        value: widget.detailPengukuranAnakResponseModel.data!
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
                        tool: widget.detailPengukuranAnakResponseModel.data!.alatBeratBadan.jenisAlat,
                        value: widget
                            .detailPengukuranAnakResponseModel.data!.beratBadan,
                      ),
                      InfoFieldMeasuringWidget(
                        title: 'Lingkar Kepala',
                        unit: 'cm',
                        tool: widget.detailPengukuranAnakResponseModel.data!.alatLingkarKepala.jenisAlat,
                        value: widget.detailPengukuranAnakResponseModel.data!
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
                text: widget
                    .detailPengukuranAnakResponseModel.data!.asiEksklusif),
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
                text: widget.detailPengukuranAnakResponseModel.data!.mpasi),
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
                        text: widget.detailPengukuranAnakResponseModel.data!.vitaminA == null || widget.detailPengukuranAnakResponseModel.data!.vitaminA! == false
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
                        text: widget.detailPengukuranAnakResponseModel.data!.obatCacing == null || widget.detailPengukuranAnakResponseModel.data!.obatCacing! == false
                        ? 'Tidak'
                        : 'Iya'
                      ),
                    ],
                  ),
                ),
              ],
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
                        'Status Stunting',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                          text: widget.detailPengukuranAnakResponseModel.data!
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
                        'Status UnderWeight',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      InfoFieldWidget(
                          text: widget.detailPengukuranAnakResponseModel.data!
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
                    text: widget.detailPengukuranAnakResponseModel.data!
                        .statusWasting),
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
                      Navigator.pushNamed(context, UPDATE_PENGUKURAN_ANAK,
                        arguments: PaketToUpdatePengukuranAnakModel(
                          pengukuranId: widget.pengukuranId, 
                          data: widget.detailPengukuranAnakResponseModel
                        )
                      ).then((value) {
                        if(value != null) {
                          detailPengukuranAnakBloc.add(GetDetailPengukuranAnak(widget.pengukuranId));
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
                          return BlocConsumer<HapusPengukuranAnakBloc, HapusPengukuranAnakState>(
                            bloc: hapusPengukuranAnakBloc,
                            listener: (context, state) {
                              if(state is HapusPengukuranAnakSuccessState) {
                                 Navigator.pop(context);
                                 Navigator.pop(context,1);
                              } 
                              if(state is HapusPengukuranAnakFailedState) {
                                debugPrint(state.error);
                              }
                            },
                            builder: (context, state) {
                              return AlertDialogWidget(
                                title: 'Apakah Anda Yakin?',
                                message:
                                    'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                mainButton: () {
                                  hapusPengukuranAnakBloc.add(SendHapusPengukuranAnak(widget.pengukuranId));
                                },
                                image: imageDeleteItems,
                                mainButtonMessage: 'Iya, Hapus Pengukuran',
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
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
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
