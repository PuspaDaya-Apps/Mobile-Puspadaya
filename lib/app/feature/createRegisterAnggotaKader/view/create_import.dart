import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';

class CreateImport extends StatefulWidget {
  const CreateImport({super.key});

  @override
  State<CreateImport> createState() => _CreateImportState();
}

class _CreateImportState extends State<CreateImport> {
  String? _fileName;
  String? _filePath;

  Future<void> _pickFile() async {
    // Memilih file menggunakan file_picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result != null) {
      logger.d('file picked');
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });
    }
  }

  void _uploadFile() {
    logger.d('Upload file');
    // Logika untuk mengupload file ke server
    if (_filePath != null) {
      logger.d('file not empty');
      // Implementasikan logika upload ke server di sini
      print('File $_fileName akan diupload ke server dari $_filePath');
    } else {
      // Tampilkan pesan jika tidak ada file yang dipilih
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan pilih file terlebih dahulu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Unggah Data Akun Kader (format: CSV atau XLSX)',
              style: AppTextStyles.primaryTextMedium.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    FaIcon(
                      color: bluePrimary70,
                      size: 32,
                      FontAwesomeIcons.cloudArrowUp,
                    ),
                    Text(
                      _fileName ?? 'Pilih File',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          if (_fileName != null) ...[
            Text(
              'File yang dipilih: $_fileName',
              style: TextStyle(fontSize: 16),
            ),
          ],
          SizedBox(height: 20),
          ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Unggah',
            mainButton: _uploadFile,
          ),
          SizedBox(height: 24),
          Text(
            'Panduan Langkah-Langkah Unggah Data Akun Kader Menggunakan File CSV/XLSX',
          ),
          SizedBox(height: 12),
          Text(
            '1. Siapkan Data dalam Format CSV atau XLSX',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Pastikan file yang akan diunggah memiliki format .csv atau .xlsx.',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 11,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '2. Isi Data Sesuai Kolom yang Ditetapkan',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Kolom pertama: Nama (isi dengan nama lengkap).\nKolom kedua: No. Telepon (isi dengan format no_telepon).\nKolom ketiga: tanggal lahir\nKolom ke 4 adalah RT\nKolom ke 5 adalah RW\nKolom terakhir adalah alamat lengkap kader',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 11,
            ),
          ),
          Row(
            children: [
              Text(
                'Contoh Format Tabel: ',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  String url =
                      "https://docs.google.com/spreadsheets/d/1HN60xTMfLqAqK_Px6_hyuX64ETegw7onKleHrwjlfDQ/edit?gid=1623751667#gid=1623751667";
                  final Uri uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    showTopSnackBar(
                        Overlay.of(context),
                        animationDuration: const Duration(milliseconds: 600),
                        displayDuration: const Duration(milliseconds: 2200),
                        reverseAnimationDuration:
                            const Duration(milliseconds: 300),
                        TopSnackbarWidget().error(
                            'Gagal, terjadi permasalahn saat download file '));
                  }
                },
                child: Text(
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    color: bluePrimaryMain,
                    fontSize: 12,
                  ),
                  'Download File Disini',
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Image(
            image: AssetImage(imageSampleImportData),
          ),
          SizedBox(height: 12),
          Text(
            '3. Simpan File',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Setelah mengisi data, simpan file dalam format .csv atau .xlsx.',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 11,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '4. Unggah File',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Klik pada area pilih file untuk mengunggah.',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 11,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '5. Klik Tombol Unggah',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            'Klik pada tombol unggah yang berada dibawah area pilih file.',
            style: AppTextStyles.primaryTextNormal.copyWith(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
