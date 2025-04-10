import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/alatUkur/update/view/update_alat_ukur.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/detail_alat_ukur_bloc.dart';

class DetailAlatUkur extends StatelessWidget {
  final String idAlatUkur;

  const DetailAlatUkur({super.key, required this.idAlatUkur});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailAlatUkurBloc(),
      child: DetailAlatUkurView(idAlatUkur: idAlatUkur),
    );
  }
}

class DetailAlatUkurView extends StatefulWidget {
  final String idAlatUkur;

  const DetailAlatUkurView({super.key, required this.idAlatUkur});

  @override
  State<DetailAlatUkurView> createState() => _DetailAlatUkurViewState();
}

class _DetailAlatUkurViewState extends State<DetailAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();

  @override
  void initState() {
    context
        .read<DetailAlatUkurBloc>()
        .add(GetDetailAlatUkurEvent(widget.idAlatUkur));
    logger.d("trigger fetch");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Alat Ukur',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<DetailAlatUkurBloc, DetailAlatUkurState>(
          listener: (context, state) {
            if (state is DeleteAlatUkurFailed) {
              logger.d(state.message);
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error(state.message),
              );
              context
                  .read<DetailAlatUkurBloc>()
                  .add(GetDetailAlatUkurEvent(widget.idAlatUkur));
            }
            if (state is DeleteAlatUkurSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil Menghapus Alat Ukur"),
              );
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            if (state is DetailAlatUkurLoading) {
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
            if (state is DetailAlatUkurFailed) {
              return Center(
                child: Text('Error ${state.message}'),
              );
            }
            if (state is DetailAlatUkurSuccess) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Jenis Alat',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(
                          text: state.data.data.alatPengukuranAdmin.jenisAlat),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      if (state.data.data.alatPengukuranAdmin.jenisAlat ==
                          'Alat Deteksi Dini') ...[
                        const Text(
                          'Alat Deteksi Dini (opsional)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        Column(
                          children: state.data.data.checklists.map((check) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IntrinsicWidth(
                                  child: CheckboxListWidget(
                                    isChecked: true,
                                    label: check.namaChecklist,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ] else
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8), // Berikan border radius
                          child: Image.network(
                            ApiUtils().urlGetPublicImage(
                                state.data.data.alatPengukuranAdmin.imageUrl),
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Merek Alat',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: state.data.data.merekAlat),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Kondisi Alat',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: state.data.data.kondisiAlat),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () async {
                          final isTrue = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UpdateAlatUkur(
                                  detailAlatUkur: state.data,
                                );
                              },
                            ),
                          );
                          if (isTrue == true) {
                            context
                                .read<DetailAlatUkurBloc>()
                                .add(GetDetailAlatUkurEvent(widget.idAlatUkur));
                          }
                          // Navigator.pushNamed(context, UPDATE_ALAT_UKUR);
                        },
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      ButtonPrimary(
                        color: redPrimaryMain,
                        mainButtonMessage: 'Hapus',
                        mainButton: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialogWidget(
                                title: 'Apakah Anda Yakin?',
                                message:
                                    'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                                mainButton: () {
                                  context.read<DetailAlatUkurBloc>().add(
                                      DetailAlatUkurDeleteEvent(
                                          widget.idAlatUkur));
                                  Navigator.pop(context);
                                },
                                image: imageDeleteItems,
                                mainButtonMessage: 'Iya, Hapus Alat Ukur',
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
            return Container();
          },
        ),
      ),
    );
  }
}

class CheckboxListWidget extends StatelessWidget {
  final bool isChecked;
  final String label;
  final ValueChanged<bool?> onChanged;

  const CheckboxListWidget({
    Key? key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            side: BorderSide(color: stroke10, width: 2),
            activeColor: bluePrimaryMain,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isChecked,
            onChanged: onChanged,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(!isChecked),
              child: Text(
                label,
                style: AppTextStyles.primaryTextNormal.copyWith(fontSize: 12),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
