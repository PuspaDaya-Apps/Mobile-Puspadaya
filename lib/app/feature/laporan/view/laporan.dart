import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/download_utils/download_utils.dart';
import '../../../../config/screen_config/image_config.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/alert_dialog_content.dart';
import '../../../view/widget/card_rapor.dart';
import '../../../view/widget/dropdown_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'card_rapor_item_model.dart';

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

  String? selectedBulan;
  String? selectedTahun;
  List<CardRaporItemModel> listRaporItem = [
    CardRaporItemModel(
      nama: 'Desa',
      deskripsi: 'Unduh data Desa',
      url: 'https://arxiv.org/pdf/23071.',
      judulRapor: 'Rapor data Desa',
    ),
    CardRaporItemModel(
      nama: 'Posyandu',
      deskripsi: 'Unduh data Posyandu',
      url: 'https://arxiv.org/pdf/23072.',
      judulRapor: 'Rapor data Posyandu',
    ),
    CardRaporItemModel(
      nama: 'Anak',
      deskripsi: 'Unduh data Anak',
      url: 'https://arxiv.org/pdf/23073.',
      judulRapor: 'Rapor data Anak',
    ),
    CardRaporItemModel(
      nama: 'Kader',
      deskripsi: 'Unduh data Kader',
      url: 'https://arxiv.org/pdf/23074.',
      judulRapor: 'Rapor data Kader',
    ),
    CardRaporItemModel(
      nama: 'Log Activity',
      deskripsi: 'Unduh data Log Activity',
      url: ApiUtils().urlDownloadLogActivity(),
      judulRapor: 'Rapor data Log Activity',
    ),
  ];
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
          itemCount: listRaporItem.length,
          itemBuilder: (context, index) {
            CardRaporItemModel cardItem = listRaporItem[index];
            return Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
              child: CardRaporWidget(
                judulRapor: '${cardItem.nama}',
                deskripsiRapor: '${cardItem.deskripsi}',
                onTap: () {
                  if (cardItem.nama == 'Log Activity') {
                    logger.d("download log Activity ${cardItem.nama}");
                    logger.d('url ${cardItem.url}');
                    DownloadUtils().downloadAndSaveFile(
                        context,
                        cardItem.url,
                        'Log-Activity.xlsx',
                        'Log Activity');
                  } else {
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
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16),
                                ),
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
                                  items: bulan,
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
                                      return 'Tahun harus dipilih'; // Error message for required field
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
                                    return PdfViewRapor(
                                      nama: '${cardItem.judulRapor}',
                                      path: '${cardItem.url}',
                                    );
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
                  }
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

  const PdfViewRapor({Key? key, required this.nama, required this.path})
      : super(key: key);

  @override
  _PdfViewRaporState createState() => _PdfViewRaporState();
}

class _PdfViewRaporState extends State<PdfViewRapor> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  bool _isError = false; // Track if there is an error loading the PDF

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
      body: _isError
          ? NotFoundPdfScreen()
          : SfPdfViewer.network(
              widget.path,
              controller: _pdfViewerController,
              key: _pdfViewerStateKey,
              onDocumentLoadFailed: (details) {
                setState(() {
                  _isError = true; // Set error state to true
                });
                logger.e('Failed to load PDF: ${details.error}');
              },
            ),
      floatingActionButton: !_isError
          ? FloatingActionButton(
              backgroundColor: greenPrimaryMain,
              shape: CircleBorder(),
              child: Center(
                child: Icon(
                  size: 24,
                  FluentIcons.arrow_download_24_filled,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                DownloadUtils().downloadAndSaveFile(
                    context, '${widget.path}', '${widget.nama}.pdf', "Laporan");
              },
            )
          : Container(),
    );
  }
}

class NotFoundPdfScreen extends StatelessWidget {
  const NotFoundPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.calWidthMultiplier(250),
                child: Image.asset(
                  pageNotFoundVector,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(20)),
              Text(
                'Mohon Maaf, dokumen tidak berhasil ditemukan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimary20,
                  fontSize: SizeConfig.calMultiplierText(20),
                  fontWeight: FontWeight.w600, // Slightly bolder for emphasis
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(10)),
              Text(
                'Terdapat masalah saat mencoba mencari dokumen, atau coba lagi nanti',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      textPrimary20.withOpacity(0.7), // Slightly lighter color
                  fontSize: SizeConfig.calMultiplierText(
                      16), // Smaller font size for the secondary message
                  fontWeight: FontWeight.w400, // Normal weight
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(30)),
              ButtonPrimary(
                  color: bluePrimaryMain,
                  mainButtonMessage: 'Kembali',
                  mainButton: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
