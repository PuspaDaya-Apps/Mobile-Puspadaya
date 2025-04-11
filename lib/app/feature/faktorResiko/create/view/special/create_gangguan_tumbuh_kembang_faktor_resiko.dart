import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../config/screen_config/image_config.dart';
import '../../../../../../config/theme/pallet_color.dart';
import '../../../../../../utils/api_utils/api_utils.dart';
import '../../../../../../utils/logger/logger.dart';
import '../../../../../view/widget/alert_dialog_widget.dart';
import '../../../../../view/widget/appbar_widget.dart';
import '../../../../../view/widget/primary_button_widget.dart';
import '../../bloc/index_parameter_faktor_resiko_bloc.dart';
import '../../model/get_index_pertanyaan_model.dart' as GetIndexPertanyaanModel;
import '../../model/select_answer_model.dart';

class CreateGangguanTumbuhKembangFaktorResiko extends StatelessWidget {
  final GetIndexPertanyaanModel.Datum data;
  final IndexParameterFaktorResikoBloc bloc;
  const CreateGangguanTumbuhKembangFaktorResiko(
      {super.key, required this.data, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: CreateGangguanTumbuhKembangFaktorResikoView(
        data: data,
      ),
    );
  }
}

class CreateGangguanTumbuhKembangFaktorResikoView extends StatefulWidget {
  final GetIndexPertanyaanModel.Datum data;
  const CreateGangguanTumbuhKembangFaktorResikoView(
      {super.key, required this.data});

  @override
  State<CreateGangguanTumbuhKembangFaktorResikoView> createState() =>
      _CreateGangguanTumbuhKembangFaktorResikoViewState();
}

class _CreateGangguanTumbuhKembangFaktorResikoViewState
    extends State<CreateGangguanTumbuhKembangFaktorResikoView> {
  String selectedIdPertanyaan = '';
  String selectedIdJawaban = '';
  bool isAvailable = false;

  @override
  void initState() {
    final hasPertanyaan = widget.data.pertanyaan.isNotEmpty;
    final hasPilihan =
        hasPertanyaan && widget.data.pertanyaan[0].pilihanPertanyaan.isNotEmpty;

    isAvailable = hasPertanyaan && hasPilihan;

    if (isAvailable) {
      selectedIdPertanyaan = widget.data.pertanyaan[0].id;
      selectedIdJawaban = widget.data.pertanyaan[0].pilihanPertanyaan[0].id;
    }

    logger.d('selectedIdPertanyaan = $selectedIdPertanyaan');
    logger.d('selectedIdJawaban = $selectedIdJawaban');
    logger
        .d('widget.data.pertanyaan.length = ${widget.data.pertanyaan.length}');
    logger.d('isAvailable = $isAvailable');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: widget.data.namaFaktorResiko,
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: isAvailable
          ? Container(
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
                            SelectAnswerModel data = SelectAnswerModel(
                                questionId: selectedIdPertanyaan,
                                answerId: [selectedIdJawaban],
                                isMultipleChoice: false);
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
            )
          : SizedBox.shrink(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Pertanyaan
                Text(
                  widget.data.keterangan,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                // Gambar Pertanyaan
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    ApiUtils().urlGetPublicImage(widget.data.gambar),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                SizedBox(height: 14),
                // 🔹 List Semua Jawaban Pilihan
                isAvailable
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.data.pertanyaan.map((pertanyaan) {
                          final selectedAnswerId =
                              pertanyaan.pilihanPertanyaan.isNotEmpty
                                  ? pertanyaan.pilihanPertanyaan[0].id
                                  : null;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pertanyaan.namaPertanyaan,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 16),
                              ...pertanyaan.pilihanPertanyaan.map((pilihan) {
                                final isSelected =
                                    pilihan.id == selectedAnswerId;
                                return _buildOptionItem(
                                  pilihan.namaPilihan,
                                  isSelected,
                                  true,
                                );
                              }).toList(),
                              SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
                      )
                    : Text(
                        'Tidak ada Data Pengukuran',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
