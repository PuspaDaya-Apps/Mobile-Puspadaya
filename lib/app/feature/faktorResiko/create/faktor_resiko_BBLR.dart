import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../../config/theme/shadow.dart';
import '../../../view/widget/alert_dialog_widget.dart';
import '../index/model/pertanyaan_model.dart';

class CreateFaktorResikoBBLR extends StatelessWidget {
  const CreateFaktorResikoBBLR({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateFaktorResikoBBLRView();
  }
}

class CreateFaktorResikoBBLRView extends StatefulWidget {
  const CreateFaktorResikoBBLRView({super.key});

  @override
  State<CreateFaktorResikoBBLRView> createState() =>
      _CreateFaktorResikoBBLRViewState();
}

class _CreateFaktorResikoBBLRViewState
    extends State<CreateFaktorResikoBBLRView> {
  List<PertanyaanModel> pertanyaan = [
    PertanyaanModel(
      id: '1',
      pertanyaan:
          'Berdasarkan Kemenkes, BBLR adalah bayi yang lahir dengan berat badan kurang dari 2.500 gram, tanpa melihat masa kehamilan. Berat Bayi Lahir?',
      opsi: [
        Opsi(id: '1', opsi: 'Kurang dari 2.500 gram'),
        Opsi(id: '4', opsi: 'Lebih dari 2500 gram'),
      ],
    ),
  ];
  Map<String, String?> selectedAnswers =
      {}; //buat ini sama dengan length dari pertanyaan dan nanti dapat di gunakan untuk select di jawaban

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'BBLR',
        background: Colors.white,
        actions: [],
        onBackPressed: () {
          warningDialog(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          return warningDialog(context);
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowSm,
                  ),
                  child: Text(
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 16,
                    ),
                    'Berdasarkan Kemenkes, BBLR adalah bayi yang lahir dengan berat badan kurang dari 2.500 gram, tanpa melihat masa kehamilan. Berat Bayi Lahir?',
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pertanyaan[0].opsi.length,
                    itemBuilder: (context, index) {
                      // bool isSelected = index == selectedAnswerIndex;
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.greenAccent,
                              width: 1.5,
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              pertanyaan[0].opsi[index].opsi,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
        mainButtonMessage: 'Kembali ke Faktor Resiko',
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
