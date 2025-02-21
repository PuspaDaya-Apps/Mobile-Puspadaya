import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../bloc/index_parameter_faktor_resiko_bloc.dart';
import '../model/get_index_pertanyaan_model.dart' as GetIndexPertanyaanModel;
import '../model/post_pertanyaan_model.dart' as PostPertanyaanModel;

class QuisionerParameterFaktorResiko extends StatelessWidget {
  final GetIndexPertanyaanModel.Datum data; // Add 'final' to make it immutable
  final IndexParameterFaktorResikoBloc bloc;

  QuisionerParameterFaktorResiko(
      {super.key, required this.data, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: QuisionerParameterFaktorResikoView(
        data: data,
      ),
    );
  }
}

class QuisionerParameterFaktorResikoView extends StatefulWidget {
  final GetIndexPertanyaanModel.Datum data;

  QuisionerParameterFaktorResikoView({super.key, required this.data});

  @override
  State<QuisionerParameterFaktorResikoView> createState() =>
      _QuisionerParameterFaktorResikoViewState();
}

class _QuisionerParameterFaktorResikoViewState
    extends State<QuisionerParameterFaktorResikoView> {
  String selectedIdPertanyaan = '';
  String selectedIdJawaban = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: widget.data.namaFaktorResiko,
        background: Colors.white,
        onBackPressed: () {
          warningDialog(context);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        child: ButtonPrimary(
          color: greenPrimaryMain,
          mainButtonMessage: 'Simpan Jawaban',
          mainButton: () {
            context.read<IndexParameterFaktorResikoBloc>().add(
                  SelectAnswer(
                    questionId: selectedIdPertanyaan,
                    answerId: selectedIdJawaban,
                    isMultipleChoice: false,
                  ),
                );

            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          return warningDialog(context);
        },
        child: SafeArea(
          child: BlocBuilder<IndexParameterFaktorResikoBloc,
              IndexParameterFaktorResikoState>(
            builder: (context, state) {
              List<PostPertanyaanModel.FaktorResiko> selectedAnswers = [];

              if (state is IndexParamterFaktorResikoUpdated) {
                selectedAnswers = state.answers;
              }

              return Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: widget.data.pertanyaan.map((pertanyaan) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pertanyaan.namaPertanyaan,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          pertanyaan.selectType == "checkbox"
                              ? "Anda dapat memilih banyak pilihan"
                              : "Anda hanya bisa memilih satu jawaban",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: pertanyaan.pilihanPertanyaan
                              .map((opsiPertanyaan) {
                            bool isSelected = (selectedIdPertanyaan ==
                                        pertanyaan.id &&
                                    selectedIdJawaban == opsiPertanyaan.id) ||
                                selectedAnswers.any((e) =>
                                    e.pertanyaanId == pertanyaan.id &&
                                    e.jawabanId.contains(opsiPertanyaan.id));

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  logger.d(
                                      'selected Id Pertanyaan ${pertanyaan.id}');
                                  logger.d(
                                      'selected Pertanyaan ${pertanyaan.namaPertanyaan}');
                                  logger.d(
                                      'selected id jawaban ${opsiPertanyaan.id}');
                                  logger.d(
                                      'selected jawaban ${opsiPertanyaan.namaPilihan}');
                                  selectedIdPertanyaan = pertanyaan.id;
                                  selectedIdJawaban = opsiPertanyaan.id;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        isSelected ? Colors.blue : Colors.grey,
                                    width: 1.5,
                                  ),
                                  color: isSelected
                                      ? Colors.blue.withOpacity(0.2)
                                      : Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      opsiPertanyaan.namaPilihan,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
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
        title: 'Apakah Anda Yakin Ingin Keluar Dari Faktor Resiko?',
        message: 'Progress jawaban yang anda isi akan terhapus',
        mainButton: () {
          // Close the dialog
          Navigator.pop(context); // Close the previous screen
        },
        image: logoutVector, // Ensure this variable is defined
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
