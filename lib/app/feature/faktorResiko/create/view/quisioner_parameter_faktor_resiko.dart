import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<String> selectedIdPertanyaanMultiple = [];
  List<String> selectedIdJawabanMultiple = [];
  late bool isMultiplePertanyaan;

  // opsi is Text true
  final TextEditingController textController = TextEditingController();
  bool isTextFieldVisible = false; // Untuk mengontrol visibilitas input teks
  String? jawabanLainnya; // Variabel untuk menyimpan jawaban dari input text

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // 🔹 Inisialisasi isMultiplePertanyaan di initState
    isMultiplePertanyaan = widget.data.pertanyaan.length > 1;

     // 🔹 Inisialisasi isMultipleSelection berdasarkan pertanyaan pertama jika soal adalah singlechoice
    if (widget.data.pertanyaan.isNotEmpty) {
      isMultipleSelection =
          widget.data.pertanyaan[0].selectType == GetIndexPertanyaanModel.SelectType.checkbox;
    }
  }

  void _goToNextPage() {
    if (_currentPage < widget.data.pertanyaan.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialogWidget(
                                  image: imageQuisioner,
                                  mainButton: () {
                                    if (isMultipleSelection) {
                                      logger.d(
                                          'selectedIdPertanyaan = $selectedIdPertanyaan');
                                      logger.d(
                                          'selectedIdJawaban = $selectedIdJawaban');
                                      logger.d(
                                          'jawaban lainnya = $jawabanLainnya');
                                      context
                                          .read<
                                              IndexParameterFaktorResikoBloc>()
                                          .add(
                                            SelectAnswer(
                                              jawabanLainnya,
                                              questionId: selectedIdPertanyaan,
                                              answerId: selectedJawabanMultiple,
                                              isMultipleChoice:
                                                  isMultipleSelection,
                                            ),
                                          );
                                    } else {
                                      logger.d(
                                          'selectedIdPertanyaan = $selectedIdPertanyaan');
                                      logger.d(
                                          'selectedIdJawaban = $selectedIdJawaban');
                                      logger.d(
                                          'jawaban lainnya = $jawabanLainnya');
                                      context
                                          .read<
                                              IndexParameterFaktorResikoBloc>()
                                          .add(
                                            SelectAnswer(
                                              jawabanLainnya,
                                              questionId: selectedIdPertanyaan,
                                              answerId: [selectedIdJawaban],
                                              isMultipleChoice:
                                                  isMultipleSelection,
                                            ),
                                          );
                                    }
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
                            if (isMultipleSelection) {
                              logger.d(
                                  'selectedIdPertanyaan = $selectedIdPertanyaan');
                              logger
                                  .d('selectedIdJawaban = $selectedIdJawaban');
                              logger.d('jawaban lainnya = $jawabanLainnya');
                              context
                                  .read<IndexParameterFaktorResikoBloc>()
                                  .add(
                                    SelectAnswer(
                                      jawabanLainnya,
                                      questionId: selectedIdPertanyaan,
                                      answerId: selectedJawabanMultiple,
                                      isMultipleChoice: isMultipleSelection,
                                    ),
                                  );
                            } else {
                              logger.d(
                                  'selectedIdPertanyaan = $selectedIdPertanyaan');
                              logger
                                  .d('selectedIdJawaban = $selectedIdJawaban');
                              logger.d('jawaban lainnya = $jawabanLainnya');
                              context
                                  .read<IndexParameterFaktorResikoBloc>()
                                  .add(
                                    SelectAnswer(
                                      jawabanLainnya,
                                      questionId: selectedIdPertanyaan,
                                      answerId: [selectedIdJawaban],
                                      isMultipleChoice: isMultipleSelection,
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

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pertanyaan.namaPertanyaan,
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

      // bool isDisabled =
      //     jawabanSistem != null && jawabanSistem == opsiPertanyaan.namaPilihan;

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
  /// 🔹 Handle untuk Checkbox (Multiple Choice)
  Column _buildMultipleChoice(GetIndexPertanyaanModel.Pertanyaan pertanyaan,
      List<PostPertanyaanModel.FaktorResiko> selectedAnswers) {
    String? jawabanSistem = pertanyaan.jawabanSistem;

    logger.d('pertanyaan jawabanSistem multiple choice = $jawabanSistem');

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
                  logger.d("Is text = $isOpsiText");
                  logger.d("Select jawaban dengan tipe soal Multiple Choice");

                  if (selectedJawabanMultiple.contains(opsiPertanyaan.id)) {
                    selectedJawabanMultiple.remove(opsiPertanyaan.id);
                  } else {
                    selectedJawabanMultiple.add(opsiPertanyaan.id);
                  }

                  // Tampilkan input text hanya jika opsi "lainnya" dipilih
                  if (isOpsiText) {
                    isTextFieldVisible =
                        selectedJawabanMultiple.contains(opsiPertanyaan.id);
                  }
                  if (!isTextFieldVisible) {
                    textController.clear();
                  }

                  selectedIdPertanyaan = pertanyaan.id;
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
