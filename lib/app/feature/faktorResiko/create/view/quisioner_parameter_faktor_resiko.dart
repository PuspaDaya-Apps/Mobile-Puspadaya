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
  List<String> selectedJawabanMultiple = []; // Untuk multiple choice
  late bool isMultipleSelection;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.data.pertanyaan.isNotEmpty) {
  //     isMultipleSelection = widget.data.pertanyaan.first.selectType ==
  //         GetIndexPertanyaanModel.SelectType.checkbox;
  //   }
  // }

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
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(24),
        child: ButtonPrimary(
          color: greenPrimaryMain,
          mainButtonMessage: 'Simpan Jawaban',
          mainButton: () {
            if (isMultipleSelection) {
              context.read<IndexParameterFaktorResikoBloc>().add(
                    SelectAnswer(
                      questionId: selectedIdPertanyaan,
                      answerId: selectedJawabanMultiple,
                      isMultipleChoice: isMultipleSelection,
                    ),
                  );
            } else {
              context.read<IndexParameterFaktorResikoBloc>().add(
                    SelectAnswer(
                      questionId: selectedIdPertanyaan,
                      answerId: [selectedIdJawaban],
                      isMultipleChoice: isMultipleSelection,
                    ),
                  );
            }

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
          child: SingleChildScrollView(
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
                      isMultipleSelection = pertanyaan.selectType ==
                          GetIndexPertanyaanModel.SelectType.checkbox;
                      logger
                          .d('is multiple selection = ${isMultipleSelection}');
                      // bool isMultipleSelection = isMultipleChoice;

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
                            isMultipleSelection
                                ? "Anda hanya bisa memilih satu jawaban "
                                : "Anda dapat memilih banyak pilihan",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          !isMultipleSelection
                              ? _buildSingleChoice(pertanyaan, selectedAnswers)
                              : _buildMultipleChoice(
                                  pertanyaan, selectedAnswers),
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
      ),
    );
  }

  /// 🔹 Handle untuk Radio Button (Single Choice)
  Column _buildSingleChoice(GetIndexPertanyaanModel.Pertanyaan pertanyaan,
      List<PostPertanyaanModel.FaktorResiko> selectedAnswers) {
    return Column(
      children: pertanyaan.pilihanPertanyaan.map((opsiPertanyaan) {
        bool isSelected = (selectedIdPertanyaan == pertanyaan.id &&
                selectedIdJawaban == opsiPertanyaan.id) ||
            selectedAnswers.any((e) =>
                e.pertanyaanId == pertanyaan.id &&
                e.jawabanId.contains(opsiPertanyaan.id));

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIdPertanyaan = pertanyaan.id;
              selectedIdJawaban = opsiPertanyaan.id;
              selectedJawabanMultiple
                  .clear(); // Pastikan hanya satu jawaban dipilih
            });
          },
          child: _buildOptionItem(opsiPertanyaan.namaPilihan, isSelected),
        );
      }).toList(),
    );
  }

  /// 🔹 Handle untuk Checkbox (Multiple Choice)
  Column _buildMultipleChoice(GetIndexPertanyaanModel.Pertanyaan pertanyaan,
      List<PostPertanyaanModel.FaktorResiko> selectedAnswers) {
    return Column(
      children: pertanyaan.pilihanPertanyaan.map((opsiPertanyaan) {
        bool isSelected = selectedJawabanMultiple.contains(opsiPertanyaan.id) ||
            selectedAnswers.any((e) =>
                e.pertanyaanId == pertanyaan.id &&
                e.jawabanId.contains(opsiPertanyaan.id));

        return GestureDetector(
          onTap: () {
            setState(() {
              if (selectedJawabanMultiple.contains(opsiPertanyaan.id)) {
                selectedJawabanMultiple.remove(opsiPertanyaan.id);
              } else {
                selectedJawabanMultiple.add(opsiPertanyaan.id);
              }
              selectedIdPertanyaan = pertanyaan.id;
            });
          },
          child: _buildOptionItem(opsiPertanyaan.namaPilihan, isSelected),
        );
      }).toList(),
    );
  }

  /// 🔹 Widget untuk Tampilan Pilihan (Digunakan di Checkbox & Radio)
  Widget _buildOptionItem(String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 1.5,
        ),
        color: isSelected ? Colors.blue.withOpacity(0.2) : Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.blue : Colors.black,
        ),
      ),
    );
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
}
