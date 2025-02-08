import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import '../../../../utils/download_utils/download_utils.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import 'files_eppgbm_model.dart';

class E_PPGBM extends StatelessWidget {
  const E_PPGBM({super.key});

  @override
  Widget build(BuildContext context) {
    return const E_PPGBMView();
  }
}

class E_PPGBMView extends StatefulWidget {
  const E_PPGBMView({super.key});

  @override
  State<E_PPGBMView> createState() => _E_PPGBMViewState();
}

class _E_PPGBMViewState extends State<E_PPGBMView> {
  bool selectedPilihSemua = false;

  // Daftar file yang ditampilkan
  List<FilesEPPGBMModel> files = [
    FilesEPPGBMModel(
        url: 'https://example.com/file1.pdf',
        filename: 'Daftar Anak ASI Eksklusif'),
    FilesEPPGBMModel(
        url: 'https://example.com/file2.pdf',
        filename: 'Daftar Anak Berdasarkan LILA'),
    FilesEPPGBMModel(
        url: 'https://example.com/file3.pdf',
        filename: 'Daftar Anak Berdasarkan Status Gizi'),
    FilesEPPGBMModel(
        url: 'https://example.com/file4.pdf',
        filename: 'Daftar Anak di Beri Vitamin A'),
    FilesEPPGBMModel(
        url: 'https://example.com/file4.pdf', filename: 'Daftar Anak Outlier'),
    FilesEPPGBMModel(
        url: 'https://example.com/file4.pdf',
        filename: 'Daftar Anak Penerima Imunisasi'),
  ];

  // Fungsi untuk memilih semua item
  void toggleSelectAll(bool? value) {
    setState(() {
      selectedPilihSemua = value ?? false;
      files = files
          .map((file) => file.copyWith(isChecked: selectedPilihSemua))
          .toList();
    });
  }

  // Fungsi untuk memilih satu item
  void toggleItem(int index) {
    setState(() {
      files[index] = files[index].copyWith(isChecked: !files[index].isChecked);
      selectedPilihSemua = files.every((file) => file.isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        title: 'Laporan E-PPGBM',
        background: Colors.white,
        onBackPressed: () => Navigator.pop(context),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white),
        child: ButtonPrimary(
          color: bluePrimaryMain,
          mainButtonMessage: 'Download',
          mainButton: () {
            List<FilesEPPGBMModel> selectedFiles =
                files.where((file) => file.isChecked).toList();
            if (selectedFiles.isNotEmpty) {
              DownloadUtils().downloadMultipleFiles(context, selectedFiles);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pilih minimal satu file!")));
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Checkbox Pilih Semua
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(color: Colors.white),
              child: CheckboxListWidget(
                isChecked: selectedPilihSemua,
                label: 'Pilih Semua',
                onChanged: toggleSelectAll,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 5,
                  ),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => toggleItem(index),
                      child: Container(
                        margin: EdgeInsets.only(top: index < 2 ? 20 : 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: files[index].isChecked
                                ? bluePrimaryMain
                                : stroke10,
                            width: 2,
                          ),
                          boxShadow: shadowSm,
                        ),
                        child: Stack(
                          children: [
                            Checkbox(
                              value: files[index].isChecked,
                              onChanged: (value) => toggleItem(index),
                            ),
                            Center(
                              child: Column(
                                spacing: 12,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(iconExcel,
                                      width: 90, color: greenPrimaryMain),
                                  Text(
                                    textAlign: TextAlign.center,
                                    files[index].filename,
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(fontSize: 14),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
