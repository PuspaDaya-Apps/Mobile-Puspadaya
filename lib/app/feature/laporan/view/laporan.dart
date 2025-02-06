import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/download_utils/download_utils.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../utils/logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../view/widget/alert_dialog_content.dart';
import '../../../view/widget/card_rapor.dart';
import '../../../view/widget/dropdown_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';

class Laporan extends StatelessWidget {
  const Laporan({super.key});

  @override
  Widget build(BuildContext context) {
    return LaporanView();
  }
}

class LaporanView extends StatefulWidget {
  const LaporanView({super.key});

  @override
  State<LaporanView> createState() => _LaporanViewState();
}

class _LaporanViewState extends State<LaporanView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> selectBulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  List<String> selectTahun = ['2023', '2024', '2025'];
  String? selectedBulan;
  String? selectedTahun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Unduh Rapor',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
              child: CardRaporWidget(
                judulRapor: 'Anak',
                deskripsiRapor: 'Unduh Rekapitulasi data Anak',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogContent(
                        title: 'Pilih Periode Cetak Rapor',
                        content: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              Text(
                                'Bulan',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              DropdownWidget(
                                hint: "Pilih Bulan",
                                value: selectedBulan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedBulan = value;
                                    // isSearching = false; // Reset search state when menu changes
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Bulan harus dipilih'; // Error message for required field
                                  }
                                  return null; // Return null if validation passes
                                },
                                items: selectBulan,
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Pilih Tahun',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              DropdownWidget(
                                hint: "Pilih Tahun",
                                value: selectedTahun,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTahun = value;
                                    // isSearching = false; // Reset search state when menu changes
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Bulan harus dipilih'; // Error message for required field
                                  }
                                  return null; // Return null if validation passes
                                },
                                items: selectTahun,
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                            ],
                          ),
                        ),
                        mainButton: () {
                          if (_formKey.currentState!.validate()) {
                            logger.d('go to pdf');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PdfViewRapor(nama: 'Jurnal LLM', path: 'https://arxiv.org/pdf/2307.06435',);
                                },
                              ),
                            );
                          }
                        },
                        mainButtonMessage: 'Lihat Rapor',
                        colorMainButton: greenPrimaryMain,
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PdfViewRapor extends StatefulWidget {
  final String nama;
  final String path;

  const PdfViewRapor({Key? key,required this.nama,required this.path}) : super(key: key);

  @override
  _PdfViewRaporState createState() => _PdfViewRaporState();
}

class _PdfViewRaporState extends State<PdfViewRapor> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    logger.d('nama ${widget.nama}, path ${widget.path}');
    _pdfViewerController = PdfViewerController();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Unduh Rapor',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SfPdfViewer.network(
        widget.path,
        controller: _pdfViewerController,
        key: _pdfViewerStateKey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenPrimaryMain,
        shape: CircleBorder(),
        child: Center(
          child: Icon(
            size: 24,
            FluentIcons.arrow_download_24_filled,
            // Corrected the usage of FontAwesome icon
            color: Colors.white,
          ),
        ),
        onPressed: () {
          DownloadUtils().downloadAndSaveFile(
            context,
            '${widget.path}',
            '${widget.nama}.pdf',
          );
        },
      ),
    );
  }
}
