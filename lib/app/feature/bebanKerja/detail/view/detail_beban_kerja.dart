import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/screen/error_server_screen.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../bloc/detailBebanKerjaBloc/detail_beban_kerja_bloc.dart';
import '../bloc/hapusBebanKerjaBloc/hapus_beban_kerja_bloc.dart';

class DetailBebanKerja extends StatelessWidget {
  const DetailBebanKerja({super.key, required this.bebanKerjaId});
  final String bebanKerjaId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailBebanKerjaBloc(),
        ),
        BlocProvider(
          create: (context) => HapusBebanKerjaBloc(),
        ),
      ],
      child: DetailBebanKerjaView(bebanKerjaId: bebanKerjaId),
    );
  }
}

class DetailBebanKerjaView extends StatefulWidget {
  const DetailBebanKerjaView({super.key, required this.bebanKerjaId});
  final String bebanKerjaId;

  @override
  State<DetailBebanKerjaView> createState() => _DetailBebanKerjaViewState();
}

class _DetailBebanKerjaViewState extends State<DetailBebanKerjaView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailBebanKerjaBloc>(context)
        .add(GetDetailBebanKerja(widget.bebanKerjaId));
  }

  @override
  Widget build(BuildContext context) {
    final hapusBebanKerjaBloc = BlocProvider.of<HapusBebanKerjaBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Beban Kerja',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: BlocConsumer<DetailBebanKerjaBloc, DetailBebanKerjaState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        builder: (context, state) {
          if (state is DetailBebanKerjaProcessState) {
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
          if (state is DetailBebanKerjaSuccesState) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.start,
                      'Bulan',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(8),
                    ),
                    InfoFieldWidget(
                        text:
                            DateFormat('MMMM y', 'id_ID').format(state.bulan)),
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black54,
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(12)),
                    Center(
                      child: Text(
                        'Daftar Pekerjaan',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(12)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.item.length,
                        itemBuilder: (context, index) {
                          if (state.item[index].subItems != null &&
                              state.item[index].subItems!.isNotEmpty) {
                            return ExpansionTile(
                              tilePadding: EdgeInsets
                                  .zero, // Menghapus padding pada judul tile
                              childrenPadding: EdgeInsets
                                  .zero, // Menghapus padding anak-anak
                              expandedCrossAxisAlignment: CrossAxisAlignment
                                  .start, // Pastikan anak-anak rata kiri
                              title: Text(
                                state.item[index].label,
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              children:
                                  state.item[index].subItems!.map((subItem) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4,
                                        bottom: 4,
                                        left: 4), // Optional padding
                                    child: Text(
                                      subItem.label,
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.primaryTextMedium
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return const SizedBox();
                            // return Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                            //   child: Text(
                            //     state.item[index].label,
                            //     style: AppTextStyles.primaryTextMedium
                            //         .copyWith(fontSize: 14),
                            //   ),
                            // );
                          }
                        },
                      ),
                    ),
                    BlocConsumer<HapusBebanKerjaBloc, HapusBebanKerjaState>(
                      listener: (context, state) {
                        debugPrint(state.toString());
                        if (state is HapusBebanKerjaSuccessState) {
                          Navigator.pop(context);
                          Navigator.pop(context, 1);
                        }
                        if (state is HapusBebanKerjaFailedState) {
                          debugPrint(state.error);
                        }
                      },
                      builder: (context, state) {
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
                                    hapusBebanKerjaBloc.add(SendHapusBebanKerja(
                                        widget.bebanKerjaId));
                                  },
                                  image: imageDeleteItems,
                                  mainButtonMessage: 'Iya, Hapus Kegiatan',
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
              ),
            );
          }
          return const ErrorServerScreen();
        },
      ),
    );
  }
}
