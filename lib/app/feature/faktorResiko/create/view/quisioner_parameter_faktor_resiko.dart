import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/faktorResiko/create/model/select_answer_model.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/textField_widget.dart';
import '../bloc/index_parameter_faktor_resiko_bloc.dart';
import '../model/get_index_pertanyaan_model.dart' as GetIndexPertanyaanModel;
import '../model/post_pertanyaan_model.dart' as PostPertanyaanModel;

class QuisionerParameterFaktorResiko extends StatelessWidget {
  final GetIndexPertanyaanModel.Datum data; // Add 'final' to make it immutable
  final IndexParameterFaktorResikoBloc bloc;

  const QuisionerParameterFaktorResiko(
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

  const QuisionerParameterFaktorResikoView({super.key, required this.data});

  @override
  State<QuisionerParameterFaktorResikoView> createState() =>
      _QuisionerParameterFaktorResikoViewState();
}

class _QuisionerParameterFaktorResikoViewState
    extends State<QuisionerParameterFaktorResikoView> {
  TextEditingController lainnyaController = TextEditingController();

  String selectedIdPertanyaan = '';
  String selectedIdJawaban = '';
  List<String> selectedJawabanMultiple = []; // Untuk multiple choice
  bool isMultipleSelection = false;

  // untuk multiple pertanyaan
  late List<SelectAnswerModel> selectedMultiplePertanyaan;
  late bool isMultiplePertanyaan;

  // opsi is Text true
  final TextEditingController textController = TextEditingController();
  bool isTextFieldVisible = false; // Untuk mengontrol visibilitas input teks
  String jawabanLainnya =
      ''; // Variabel untuk menyimpan jawaban dari input text

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // 🔹 Inisialisasi isMultiplePertanyaan di initState
    isMultiplePertanyaan = widget.data.pertanyaan.length > 1;

    // inisiasi selectedMultiplePertanyaan
    selectedMultiplePertanyaan = [];

    // 🔹 Inisialisasi isMultipleSelection berdasarkan pertanyaan pertama jika soal adalah singlechoice
    if (widget.data.pertanyaan.isNotEmpty) {
      isMultipleSelection = widget.data.pertanyaan[0].selectType ==
          GetIndexPertanyaanModel.SelectType.checkbox;
    }
  }

  void _goToNextPage() {
    final pertanyaanSaatIni = widget.data.pertanyaan[_currentPage];
    final bool isMultipleChoice = pertanyaanSaatIni.selectType ==
        GetIndexPertanyaanModel.SelectType.checkbox;
    // 🔹 Periksa apakah user sudah memilih jawaban
    // 🔹 Validasi jika user belum memilih jawaban
    if ((!isMultipleChoice && selectedIdJawaban.isEmpty) ||
        (isMultipleChoice && selectedJawabanMultiple.isEmpty)) {
      showDialog(
        context: context,
        builder: (_) => AlertDialogWidget(
          title: 'Harap Isi Jawaban',
          message:
              'Soal belum terjawab, harap jawab terlebih dahulu sebelum melanjutkan',
          mainButton: () {
            Navigator.pop(context);
          },
          image: imageAlertWarning,
          mainButtonMessage: 'Kembali',
          colorMainButton: greenPrimaryMain,
          cancelButton: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          cancelButtonMessage: 'Keluar',
        ),
      );
      return;
    }

// 🔹 Pastikan jawaban multiple choice benar-benar tersimpan
    List<String> finalAnswerId = isMultipleChoice
        ? List.from(
            selectedJawabanMultiple) // Pastikan data disalin dengan benar
        : [selectedIdJawaban];

    SelectAnswerModel selectedAnswer = SelectAnswerModel(
      questionId: pertanyaanSaatIni.id,
      answerId: finalAnswerId,
      isMultipleChoice: isMultipleChoice,
      otherAnswer: jawabanLainnya.isEmpty ? null : jawabanLainnya,
    );

    // 🔹 Update atau tambahkan jawaban jika sudah ada
    int existingIndex = selectedMultiplePertanyaan.indexWhere(
      (answer) => answer.questionId == pertanyaanSaatIni.id,
    );

    if (existingIndex != -1) {
      selectedMultiplePertanyaan[existingIndex] = selectedAnswer;
    } else {
      selectedMultiplePertanyaan.add(selectedAnswer);
    }

    // 🔹 Reset variabel untuk pertanyaan berikutnya
    setState(() {
      selectedIdJawaban = "";
      selectedJawabanMultiple = []; // Perbarui list dengan list baru
      jawabanLainnya = "";
      textController.clear();
      isTextFieldVisible = false;

      if (_currentPage < widget.data.pertanyaan.length - 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    logger.d(
        "Selected Multiple Pertanyaan: ${selectedMultiplePertanyaan.length}");
    logger.d("Jawaban Tersimpan: $finalAnswerId");
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      final previousPertanyaan = widget.data.pertanyaan[_currentPage - 1];

      // 🔹 Ambil jawaban yang sudah disimpan
      SelectAnswerModel? previousAnswer = selectedMultiplePertanyaan.firstWhere(
        (answer) => answer.questionId == previousPertanyaan.id,
        orElse: () => SelectAnswerModel(
          questionId: previousPertanyaan.id,
          answerId: [],
          isMultipleChoice: previousPertanyaan.selectType ==
              GetIndexPertanyaanModel.SelectType.checkbox,
        ),
      );

      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        // 🔹 Set ulang UI sesuai jawaban sebelumnya
        bool isMultipleChoice = previousAnswer.isMultipleChoice;
        selectedIdJawaban =
            isMultipleChoice ? "" : previousAnswer.answerId.first;
        selectedJawabanMultiple =
            isMultipleChoice ? List.from(previousAnswer.answerId) : [];
        jawabanLainnya = previousAnswer.otherAnswer ?? "";
        textController.text = jawabanLainnya;
        isTextFieldVisible = jawabanLainnya.isNotEmpty;
      });

      logger.d("Kembali ke soal sebelumnya: $_currentPage");
      logger.d("Jawaban sebelumnya: ${previousAnswer.answerId}");
    }
  }

  void _submitAnswers() {
    final pertanyaanSaatIni = widget.data.pertanyaan[_currentPage];
    final bool isMultipleChoice = pertanyaanSaatIni.selectType ==
        GetIndexPertanyaanModel.SelectType.checkbox;

    // 🔹 Simpan jawaban pertanyaan terakhir jika belum tersimpan
    if (selectedIdJawaban.isNotEmpty || selectedJawabanMultiple.isNotEmpty) {
      SelectAnswerModel selectedAnswer = SelectAnswerModel(
        questionId: pertanyaanSaatIni.id,
        answerId:
            isMultipleChoice ? selectedJawabanMultiple : [selectedIdJawaban],
        isMultipleChoice: isMultipleChoice,
        otherAnswer: jawabanLainnya.isEmpty ? null : jawabanLainnya,
      );

      // 🔹 Update jika sudah ada, atau tambahkan jawaban baru
      int existingIndex = selectedMultiplePertanyaan.indexWhere(
        (answer) => answer.questionId == pertanyaanSaatIni.id,
      );

      if (existingIndex != -1) {
        selectedMultiplePertanyaan[existingIndex] = selectedAnswer;
      } else {
        selectedMultiplePertanyaan.add(selectedAnswer);
      }
    }

    // 🔹 Kirim semua jawaban ke BLoC
    context.read<IndexParameterFaktorResikoBloc>().add(
          SelectMultipleAnswer(data: selectedMultiplePertanyaan),
        );

    // Navigator.pop(context);
  }

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
        child: isMultiplePertanyaan
            ? Row(
                spacing: _currentPage > 0 ? 12 : 0,
                mainAxisAlignment:
                    MainAxisAlignment.center, // Agar tombol berjarak
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: ButtonPrimary(
                        color: bluePrimaryMain,
                        mainButtonMessage: "Sebelumnya",
                        mainButton: _goToPreviousPage,
                      ),
                    )
                  else
                    SizedBox
                        .shrink(), // Menghilangkan widget agar layout tetap rapi/ Jarak antar tombol
                  Expanded(
                    child: ButtonPrimary(
                      color: greenPrimaryMain,
                      mainButtonMessage:
                          _currentPage == widget.data.pertanyaan.length - 1
                              ? "Simpan Jawaban"
                              : "Selanjutnya",
                      mainButton: () {
                        if (_currentPage == widget.data.pertanyaan.length - 1) {
                          // multiple pertanyaan
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialogWidget(
                                  image: imageQuisioner,
                                  mainButton: () {
                                    _submitAnswers();
                                    // if (isMultipleSelection) {
                                    //   // multiple choice
                                    //   logger.d(
                                    //       'selectedIdPertanyaan = $selectedIdPertanyaan');
                                    //   logger.d(
                                    //       'selectedIdJawaban = $selectedIdJawaban');
                                    //   logger.d(
                                    //       'jawaban lainnya = $jawabanLainnya');
                                    // } else {
                                    //   // single choice
                                    //   logger.d(
                                    //       'selectedIdPertanyaan = $selectedIdPertanyaan');
                                    //   logger.d(
                                    //       'selectedIdJawaban = $selectedIdJawaban');
                                    //   logger.d(
                                    //       'jawaban lainnya = $jawabanLainnya');
                                    //   _submitAnswers();
                                    // }
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  cancelButtonMessage:
                                      'Kembali ke faktor resiko',
                                  title:
                                      'Apakah anda yakin dengan jawaban anda',
                                  message:
                                      'Pastikan jawaban yang Anda pilih sudah benar sebelum disimpan',
                                  cancelButton: () {
                                    Navigator.pop(context); // Tutup dialog
                                  },
                                  mainButtonMessage: 'Iya, Saya Sudah Yakin',
                                  colorMainButton: bluePrimaryMain);
                            },
                          );
                        } else {
                          _goToNextPage();
                        }
                      },
                    ),
                  ),
                ],
              )
            : ButtonPrimary(
                color: greenPrimaryMain,
                mainButtonMessage: 'Simpan Jawaban',
                mainButton: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialogWidget(
                          image: imageQuisioner,
                          mainButton: () {
                            // single pertanyaan multiple choice
                            if (isMultipleSelection) {
                              logger.d(
                                  'selectedIdPertanyaan = $selectedIdPertanyaan');
                              logger
                                  .d('selectedIdJawaban = $selectedIdJawaban');
                              logger.d('jawaban lainnya = $jawabanLainnya');
                              SelectAnswerModel data = SelectAnswerModel(
                                  otherAnswer: jawabanLainnya.isEmpty
                                      ? null
                                      : jawabanLainnya,
                                  questionId: selectedIdPertanyaan,
                                  answerId: selectedJawabanMultiple,
                                  isMultipleChoice: isMultipleSelection);
                              context
                                  .read<IndexParameterFaktorResikoBloc>()
                                  .add(
                                    SelectAnswer(data: data),
                                  );
                            } else {
                              // single pertanyaan single choice
                              logger.d(
                                  'selectedIdPertanyaan = $selectedIdPertanyaan');
                              logger
                                  .d('selectedIdJawaban = $selectedIdJawaban');
                              logger.d('jawaban lainnya = $jawabanLainnya');
                              SelectAnswerModel data = SelectAnswerModel(
                                  otherAnswer: jawabanLainnya.isEmpty
                                      ? null
                                      : jawabanLainnya,
                                  questionId: selectedIdPertanyaan,
                                  answerId: [selectedIdJawaban],
                                  isMultipleChoice: isMultipleSelection);
                              context
                                  .read<IndexParameterFaktorResikoBloc>()
                                  .add(
                                    SelectAnswer(
                                      data: data,
                                    ),
                                  );
                            }
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          cancelButtonMessage: 'Kembali ke faktor resiko',
                          title: 'Apakah anda yakin dengan jawaban anda',
                          message:
                              'Pastikan jawaban yang Anda pilih sudah benar sebelum disimpan',
                          cancelButton: () {
                            Navigator.pop(context); // Tutup dialog
                          },
                          mainButtonMessage: 'Iya, Saya Sudah Yakin',
                          colorMainButton: bluePrimaryMain);
                    },
                  );
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
              isMultiplePertanyaan = widget.data.pertanyaan.length > 1;
              logger.d('isMultiplePertanyaan = $isMultiplePertanyaan');
              logger.d('is multiple selection = $isMultipleSelection');

              return Container(
                padding: EdgeInsets.all(24),
                child: isMultiplePertanyaan
                    // multiple pertanyaan
                    ? PageView.builder(
                        controller: _pageController,
                        physics:
                            NeverScrollableScrollPhysics(), // Cegah swipe manual
                        itemCount: isMultiplePertanyaan
                            ? widget.data.pertanyaan.length
                            : 1,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final pertanyaan = widget.data.pertanyaan[index];
                          bool isMultipleSelection = pertanyaan.selectType ==
                              GetIndexPertanyaanModel.SelectType.checkbox;

                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pertanyaan.namaPertanyaan,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      12), // Ubah sesuai kebutuhan
                                  child: Image.network(
                                    ApiUtils()
                                        .urlGetPublicImage(widget.data.gambar),
                                    fit: BoxFit
                                        .cover, // Agar gambar terisi dengan baik
                                    width: double
                                        .infinity, // Sesuaikan dengan desain
                                    height: 200, // Sesuaikan dengan desain
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  isMultipleSelection
                                      ? "Anda dapat memilih banyak pilihan"
                                      : "Anda hanya bisa memilih satu jawaban",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                !isMultipleSelection
                                    ? _buildSingleChoice(
                                        pertanyaan, selectedAnswers)
                                    : _buildMultipleChoice(
                                        pertanyaan, selectedAnswers),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      )

                    // single pertanyaan
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.pertanyaan.first.namaPertanyaan,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  12), // Ubah sesuai kebutuhan
                              child: Image.network(
                                ApiUtils()
                                    .urlGetPublicImage(widget.data.gambar),
                                fit: BoxFit
                                    .cover, // Agar gambar terisi dengan baik
                                width:
                                    double.infinity, // Sesuaikan dengan desain
                                height: 200, // Sesuaikan dengan desain
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              isMultipleSelection
                                  ? "Anda dapat memilih banyak pilihan"
                                  : "Anda hanya bisa memilih satu jawaban",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 10),
                            !isMultipleSelection
                                ? _buildSingleChoice(
                                    widget.data.pertanyaan.first,
                                    selectedAnswers)
                                : _buildMultipleChoice(
                                    widget.data.pertanyaan.first,
                                    selectedAnswers),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// 🔹 Handle untuk Radio Button (Single Choice)
  Column _buildSingleChoice(GetIndexPertanyaanModel.Pertanyaan pertanyaan,
      List<PostPertanyaanModel.FaktorResiko> selectedAnswers) {
    String? jawabanSistem = pertanyaan.jawabanSistem;

    // ✅ Set default jika ada jawaban sistem (hanya dilakukan sekali)
    if (jawabanSistem != null && selectedIdPertanyaan.isEmpty) {
      for (var opsi in pertanyaan.pilihanPertanyaan) {
        if (opsi.namaPilihan == jawabanSistem) {
          selectedIdPertanyaan = pertanyaan.id;
          selectedIdJawaban = opsi.id;
          jawabanLainnya = opsi.namaPilihan;
          break;
        }
      }
    }

    logger.d('pertanyaan jawabanSistem single choice = $jawabanSistem');

    List<Widget> pilihanWidgets =
        pertanyaan.pilihanPertanyaan.map((opsiPertanyaan) {
      bool isJawabanSistem =
          jawabanSistem != null && opsiPertanyaan.namaPilihan == jawabanSistem;

      bool isSelected = isJawabanSistem ||
          (selectedIdPertanyaan == pertanyaan.id &&
              selectedIdJawaban == opsiPertanyaan.id) ||
          selectedAnswers.any((e) =>
              e.pertanyaanId == pertanyaan.id &&
              e.jawabanId.contains(opsiPertanyaan.id));

      bool isOpsiText = opsiPertanyaan.isText;

      return GestureDetector(
        onTap: jawabanSistem == null
            ? () {
                setState(() {
                  logger.d("Is text = $isOpsiText");
                  logger.d("Select jawaban dengan tipe soal singleChoice");
                  selectedIdPertanyaan = pertanyaan.id;
                  selectedIdJawaban = opsiPertanyaan.id;
                  selectedJawabanMultiple.clear();
                  isTextFieldVisible = isOpsiText;
                  if (!isOpsiText) {
                    textController.clear();
                  }
                });
              }
            : null,
        child: _buildOptionItem(
            opsiPertanyaan.namaPilihan, isSelected, jawabanSistem != null),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...pilihanWidgets,
        if (isTextFieldVisible)
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: TextFieldWidget(
              isEnable: true,
              hintText: "Masukkan Jawaban",
              isPasswordField: false,
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: textController,
              valueSet: (value) {
                setState(() {
                  jawabanLainnya = value;
                  logger.d("Jawaban teks: $value");
                });
              },
            ),
          ),
      ],
    );
  }

  /// 🔹 Handle untuk Checkbox (Multiple Choice)
  Column _buildMultipleChoice(GetIndexPertanyaanModel.Pertanyaan pertanyaan,
      List<PostPertanyaanModel.FaktorResiko> selectedAnswers) {
    String? jawabanSistem = pertanyaan.jawabanSistem;

    logger.d('Jawaban Sistem: $jawabanSistem');

    List<Widget> pilihanWidgets =
        pertanyaan.pilihanPertanyaan.map((opsiPertanyaan) {
      bool isJawabanSistem =
          jawabanSistem != null && opsiPertanyaan.namaPilihan == jawabanSistem;

      bool isSelected = isJawabanSistem ||
          selectedJawabanMultiple.contains(opsiPertanyaan.id) ||
          selectedAnswers.any((e) =>
              e.pertanyaanId == pertanyaan.id &&
              e.jawabanId.contains(opsiPertanyaan.id));

      bool isOpsiText = opsiPertanyaan.isText;

      return GestureDetector(
        onTap: jawabanSistem == null
            ? () {
                setState(() {
                  if (selectedJawabanMultiple.contains(opsiPertanyaan.id)) {
                    selectedJawabanMultiple = List.from(selectedJawabanMultiple)
                      ..remove(opsiPertanyaan.id);
                  } else {
                    selectedJawabanMultiple = List.from(selectedJawabanMultiple)
                      ..add(opsiPertanyaan.id);
                  }

                  if (isOpsiText) {
                    isTextFieldVisible =
                        selectedJawabanMultiple.contains(opsiPertanyaan.id);
                  } else {
                    isTextFieldVisible = false;
                    textController.clear();
                  }
                });

                logger.d("Selected Multiple: $selectedJawabanMultiple");
              }
            : null,
        child: _buildOptionItem(
            opsiPertanyaan.namaPilihan, isSelected, jawabanSistem != null),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...pilihanWidgets,
        if (isTextFieldVisible)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldWidget(
              isEnable: true,
              hintText: "Masukkan Jawaban",
              isPasswordField: false,
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: textController,
              valueSet: (value) {
                setState(() {
                  jawabanLainnya = value;
                });

                logger.d("Jawaban Text: $value");
              },
            ),
          ),
      ],
    );
  }

  /// 🔹 Widget untuk Tampilan Pilihan (Digunakan di Checkbox & Radio)
  Widget _buildOptionItem(String title, bool isSelected, bool isDisabled) {
    logger.d('isSelected = $isSelected, isDisabled = $isDisabled');
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Colors.blue
              : (isDisabled ? Colors.grey : Colors.grey),
          width: 1.5,
        ),
        color: isSelected
            ? Colors.blue.withValues(alpha: 0.2)
            : (isDisabled ? Colors.grey.shade100 : Color(0xFFFAFAFA)),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: isSelected
              ? Colors.blue
              : (isDisabled ? Colors.grey.shade600 : Colors.black),
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
