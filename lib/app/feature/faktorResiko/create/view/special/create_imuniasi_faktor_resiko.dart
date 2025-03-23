import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/faktorResiko/create/model/select_answer_model.dart';
import 'package:puspadaya/utils/api_utils/api_utils.dart';

import '../../../../../../config/screen_config/image_config.dart';
import '../../../../../../config/theme/pallet_color.dart';
import '../../../../../../utils/logger/logger.dart';
import '../../../../../view/widget/alert_dialog_widget.dart';
import '../../../../../view/widget/appbar_widget.dart';
import '../../../../../view/widget/primary_button_widget.dart';
import '../../bloc/index_parameter_faktor_resiko_bloc.dart';
import '../../model/post_pertanyaan_model.dart' as PostPertanyaanModel;
import '../../model/get_index_pertanyaan_model.dart' as GetIndexPertanyaanModel;

class CreateImuniasiFaktorResiko extends StatelessWidget {
  final GetIndexPertanyaanModel.Datum data; // Add 'final' to make it immutable
  final IndexParameterFaktorResikoBloc bloc;
  const CreateImuniasiFaktorResiko(
      {super.key, required this.data, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: CreateImunisasiFaktorResikoView(
        data: data,
      ),
    );
  }
}

class CreateImunisasiFaktorResikoView extends StatefulWidget {
  final GetIndexPertanyaanModel.Datum data; // Add 'final' to make it immutable
  const CreateImunisasiFaktorResikoView({super.key, required this.data});

  @override
  State<CreateImunisasiFaktorResikoView> createState() =>
      _CreateImunisasiFaktorResikoViewState();
}

class _CreateImunisasiFaktorResikoViewState
    extends State<CreateImunisasiFaktorResikoView> {
  String selectedIdPertanyaan = '';
  List<String> selectedJawabanMultiple = []; // Untuk multiple choice
  Map<String, dynamic> generateVaksinSchedule(
      List<GetIndexPertanyaanModel.PilihanPertanyaan> pilihan) {
    Map<String, dynamic> vaksinSchedule = {};

    for (var item in pilihan) {
      String namaPilihan = item.namaPilihan; // Nama vaksin
      String uuid = item.id; // ID vaksin

      // Menentukan kategori usia berdasarkan nama vaksin
      String usia = categorizeVaccineAge(namaPilihan);

      if (!vaksinSchedule.containsKey(usia)) {
        vaksinSchedule[usia] = [];
      }

      vaksinSchedule[usia].add({'id': uuid, 'vaksin': namaPilihan});
    }

    return vaksinSchedule;
  }

  /// 🔹 Menentukan kategori usia berdasarkan vaksin
  String categorizeVaccineAge(String vaksinName) {
    if (vaksinName.contains('HB0')) return '0-24 Jam';
    if (vaksinName.contains('BCG') || vaksinName.contains('OPV 1'))
      return '1 Bulan';
    if (vaksinName.contains('DPT-HB-HIB1') ||
        vaksinName.contains('OPV2') ||
        vaksinName.contains('PCV1') ||
        vaksinName.contains('RV1')) return '2 Bulan';
    if (vaksinName.contains('DPT-HB-HIB2') ||
        vaksinName.contains('OPV3') ||
        vaksinName.contains('PCV2') ||
        vaksinName.contains('RV2')) return '3 Bulan';
    if (vaksinName.contains('DPT-HB-HIB3') ||
        vaksinName.contains('OPV4') ||
        vaksinName.contains('PCV3') ||
        vaksinName.contains('IPV1') ||
        vaksinName.contains('RV3')) return '4 Bulan';
    if (vaksinName.contains('Campak Rubela 1') || vaksinName.contains('IPV2'))
      return '9 Bulan';
    if (vaksinName.contains('PCV3')) return '12 Bulan';
    if (vaksinName.contains('DPT-HB-HIB4') ||
        vaksinName.contains('Campak Rubela 2')) return '19 Bulan';

    return 'Lainnya'; // Default jika tidak cocok dengan kategori usia
  }

  bool isMultipleSelection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Imunisasi fix",
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
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialogWidget(
                    image: imageQuisioner,
                    mainButton: () {
                      SelectAnswerModel data = SelectAnswerModel( questionId: selectedIdPertanyaan, answerId: selectedJawabanMultiple, isMultipleChoice: isMultipleSelection);
                      context.read<IndexParameterFaktorResikoBloc>().add(
                            SelectAnswer(
                              data: data,
                            ),
                          );
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
                      List<GetIndexPertanyaanModel.PilihanPertanyaan> pilihan =
                          widget.data.pertanyaan[0].pilihanPertanyaan;
                      Map<String, dynamic> vaksinSchedule =
                          generateVaksinSchedule(pilihan);

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
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                12), // Ubah sesuai kebutuhan
                            child: Image.network(
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                   ApiUtils().urlGetPublicImage(widget.data.gambar),
                                  fit: BoxFit
                                      .cover, // Agar gambar terisi dengan baik
                                  width: double
                                      .infinity, // Sesuaikan dengan desain
                                  height: 200, // Sesuaikan deng
                                );
                              },
                              widget.data.gambar,
                              fit: BoxFit
                                  .cover, // Agar gambar terisi dengan baik
                              width: double.infinity, // Sesuaikan dengan desain
                              height: 200, // Sesuaikan dengan desain
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                              '0-24 jam (Hb0 untuk mencegah Hepatitis B dan Kanker Hati)'),
                          SizedBox(height: 4),
                          Text(
                              '1 bulan (BCG dan OPV 1 untuk mencegah Tuberkulosis dan Polio)'),
                          SizedBox(height: 4),
                          Text(
                              '2 bulan (DPT-HB-HIB1, OPV2, PCV1, RV1 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                          SizedBox(height: 4),
                          Text(
                              '3 bulan (DPT-HB-HIB2, OPV3, PCV2, RV2 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                          SizedBox(height: 4),
                          Text(
                              '4 bulan (DPT-HB-HIB3, OPV4, PCV3, IPV1, RV3 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                          SizedBox(height: 4),
                          Text(
                              '9 bulan (Campak Rubela 1, IPV2  untuk mencegah campak, Rubela dan Polio)'),
                          SizedBox(height: 4),
                          Text('12 bulan (PCV3 untuk mencegah Pneumonia)'),
                          SizedBox(height: 4),
                          Text(
                              '19 bulan (DPT-HB-HIB4, Campak Rubela 2 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Pneumonia, Campak, Rubela)'),
                          SizedBox(height: 16),
                          Text(
                            "Anda dapat memilih banyak pilihan",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(height: 10),
                          _buildMultipleChoice(
                              pertanyaan, selectedAnswers, vaksinSchedule),
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

  /// 🔹 Handle untuk Checkbox (Multiple Choice)
  Column _buildMultipleChoice(
    GetIndexPertanyaanModel.Pertanyaan pertanyaan,
    List<PostPertanyaanModel.FaktorResiko> selectedAnswers,
    Map<String, dynamic> vaksinSchedule,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: vaksinSchedule.entries.map((entry) {
        String usia = entry.key; // "0-24 Jam", "1 Bulan", dll.
        List<dynamic> vaksins = entry.value; // Ambil daftar vaksin

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Menampilkan usia sebagai teks biasa (bukan opsi)
            Text(
              usia,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // 🔹 Menampilkan daftar vaksin sebagai opsi pilihan
            Column(
              children: vaksins.map((vaksinData) {
                String vaksinName = vaksinData['vaksin']; // Nama vaksin
                String vaksinId = vaksinData['id']; // UUID vaksin

                bool isSelected = selectedJawabanMultiple.contains(vaksinId) ||
                    selectedAnswers.any((e) =>
                        e.pertanyaanId == pertanyaan.id &&
                        e.jawabanId.contains(vaksinId));

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedJawabanMultiple.contains(vaksinId)) {
                        selectedJawabanMultiple.remove(vaksinId);
                      } else {
                        selectedJawabanMultiple.add(vaksinId);
                      }
                      selectedIdPertanyaan = pertanyaan.id;
                    });
                  },
                  child: _buildOptionItem(vaksinName, isSelected),
                );
              }).toList(),
            ),

            SizedBox(height: 12), // Jarak antar kategori usia imunisasi
          ],
        );
      }).toList(),
    );
  }

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
            Navigator.pop(context);
          },
          cancelButtonMessage: 'Keluar',
        );
      },
    );
  }
}
