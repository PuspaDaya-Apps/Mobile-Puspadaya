import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

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
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });
    }
  }

  void _uploadFile() {
    // Logika untuk mengupload file ke server
    if (_filePath != null) {
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
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
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
                mainButtonMessage: 'Simpan',
                mainButton: _uploadFile),
          ],
        ),
      ),
    );
  }
}
