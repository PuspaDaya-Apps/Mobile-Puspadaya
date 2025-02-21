import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/faktorResiko/create/bloc/index_parameter_faktor_resiko_bloc.dart';
import 'package:puspadaya/app/view/screen/data_not_found_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/alert_dialog_petunjuk_faktor_resiko.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/parameter_faktor_resiko_item.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../model/get_index_pertanyaan_model.dart' as GetIndexPertanyaanModel;
import 'quisioner_parameter_faktor_resiko.dart';

class CreateParameterFaktorResiko extends StatelessWidget {
  final String anakId;
  const CreateParameterFaktorResiko({super.key, required this.anakId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexParameterFaktorResikoBloc(),
      child: CreateParameterFaktorResikoView(
        anakId: anakId,
      ),
    );
  }
}

class CreateParameterFaktorResikoView extends StatefulWidget {
  final String anakId;
  const CreateParameterFaktorResikoView({super.key, required this.anakId});

  @override
  State<CreateParameterFaktorResikoView> createState() =>
      _CreateParameterFaktorResikoViewState();
}

class _CreateParameterFaktorResikoViewState
    extends State<CreateParameterFaktorResikoView> {
  @override
  void initState() {
    context
        .read<IndexParameterFaktorResikoBloc>()
        .add(FetchFaktorResikoById(widget.anakId));
    logger.d(
        'jawaban yang telah diisi ${context.read<IndexParameterFaktorResikoBloc>().dataQuisioner}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexParameterFaktorResiko =
        BlocProvider.of<IndexParameterFaktorResikoBloc>(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Faktor Resiko Permasalahan Gizi',
        background: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16), // Add some margin
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogPetunjuk();
                  },
                );
              },
              child: Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: greenPrimaryMain, // Icon color
                size: 24, // Icon size
              ),
            ),
          ),
        ],
        onBackPressed: () {
          if (context
              .read<IndexParameterFaktorResikoBloc>()
              .isAnswerQuisioner) {
            // Jika ada jawaban, tampilkan dialog peringatan
            warningDialog(context);
          } else {
            // Jika tidak ada jawaban, langsung keluar
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: backgroundWhite10,
      bottomNavigationBar: context
              .watch<IndexParameterFaktorResikoBloc>()
              .isAnswerQuisioner
          ? Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ButtonPrimary(
                color: bluePrimaryMain,
                mainButtonMessage: 'Simpan Pendataan',
                mainButton: () {
                  final answers = context
                      .read<IndexParameterFaktorResikoBloc>()
                      .dataQuisioner;
                  // ✅ Log ke console untuk debugging
                  print(
                      "Jawaban yang disimpan: ${answers.map((e) => e.toJson()).toList()}");
                  context.read<IndexParameterFaktorResikoBloc>().add(
                      SendAnswerQuestion(anakId: widget.anakId, data: answers));
                  // simpan pendataan
                  // Navigator.pop(context);
                },
              ),
            )
          : null,
      body: PopScope(
        canPop:
            !context.watch<IndexParameterFaktorResikoBloc>().isAnswerQuisioner,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          return warningDialog(context);
        },
        child: BlocConsumer<IndexParameterFaktorResikoBloc,
            IndexParameterFaktorResikoState>(
          listener: (context, state) {
            if (state is IndexParameterFaktorResikoSendSucces) {
              showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(milliseconds: 600),
                  displayDuration: const Duration(milliseconds: 2200),
                  reverseAnimationDuration: const Duration(milliseconds: 300),
                  TopSnackbarWidget()
                      .success('Berhasil Menambah Faktor Resiko'));
              Navigator.pop(context);
            }
            if (state is IndexParamterFaktorResikoSendFailed) {
              showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(milliseconds: 600),
                  displayDuration: const Duration(milliseconds: 2200),
                  reverseAnimationDuration: const Duration(milliseconds: 300),
                  TopSnackbarWidget().error('${state.message}'));
            }
          },
          builder: (context, state) {
            if (state is IndexParamterFaktorResikoLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is IndexParamterFaktorResikoFailed) {
              return Center(
                child: Text(
                    'Error Ketika Mendapatakan Data Paramter Faktor Resiko ${state.message}'),
              );
            }
            if (state is IndexParamterFaktorResikoSuccess) {
              if (state.data.data.isEmpty) {
                return DataNotFoundScreen();
              }
              return ListView.builder(
                itemCount: state.data.data.length,
                itemBuilder: (context, index) {
                  GetIndexPertanyaanModel.Datum parameter =
                      state.data.data[index];
                  final answers = context
                      .read<IndexParameterFaktorResikoBloc>()
                      .dataQuisioner; // Berisi daftar jawaban yang dipilih

                  // ✅ Cek apakah ada pertanyaan yang sudah dijawab
                  bool isDone = answers.any((answer) => parameter.pertanyaan
                      .any((q) => q.id == answer.pertanyaanId));
                  logger.d('jawaban yang diterima ${answers} ');

                  bool isCompleteQuestion = parameter.isCompleted;
                  if (isCompleteQuestion)
                    return SizedBox(); // Jangan tampilkan jika sudah selesai
                  // if (parameter.pertanyaan[index].id ==
                  //     answers[index].pertanyaanId) ;
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 5, left: 16, right: 16),
                    child: ParameterFaktorResikoItem(
                      isDone: isDone,
                      status: isDone,
                      judul: parameter.namaFaktorResiko,
                      keterangan: parameter.keterangan,
                      terakhirDiisi: parameter.lastCompleted,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QuisionerParameterFaktorResiko(
                                data: parameter,
                                bloc: indexParameterFaktorResiko,
                              );
                            },
                          ),
                        );
                        context
                            .read<IndexParameterFaktorResikoBloc>()
                            .add(FetchFaktorResikoById(widget.anakId));
                      },
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Future<void> warningDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(
        title: 'Anda Belum Mengklik Tombol "Simpan Pendataan"',
        message:
            'Jika anda sudah mengisi lalu tidak mengklik Simpan Pendataan, maka progress akan hilang dan data tidak akan tersimpan.',
        mainButton: () {
          // Close the dialog
          Navigator.pop(context); // Close the previous screen
        },
        image: imageAlertWarning, // Ensure this variable is defined
        mainButtonMessage: 'Kembali',
        colorMainButton: greenPrimaryMain, // Ensure this variable is defined
        cancelButton: () {
          Navigator.pop(context);
          Navigator.pop(context); // Close the dialog
        },
        cancelButtonMessage: 'Keluar',
      );
    },
  );
}
