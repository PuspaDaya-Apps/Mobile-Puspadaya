import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../app/feature/eppgbm/view/files_eppgbm_model.dart';
import '../../config/screen_config/image_config.dart';
import '../../config/screen_config/size_config.dart';
import '../../config/theme/text_style.dart';
import '../../route/route_name.dart';
import '../api_utils/api_utils.dart';
import '../logger/logger.dart';
import '../shared_preferences_utils/shared_preferences_utils.dart';

class DownloadUtils {
  Future<void> downloadAndSaveFile(
      BuildContext context, String url, String filename) async {
    try {
      // // ✅ Periksa dan Minta Izin Penyimpanan
      // if (Platform.isAndroid) {
      //   final storagePermission = await Permission.storage.request();

      //   int androidVersion = 0;
      //   try {
      //     androidVersion = int.parse(
      //         Platform.operatingSystemVersion.split(' ')[1].split('.')[0]);
      //   } catch (e) {
      //     logger.e("Gagal mendapatkan versi Android: $e");
      //   }

      //   if (androidVersion >= 11) {
      //     final manageStoragePermission =
      //         await Permission.manageExternalStorage.request();

      //     if (manageStoragePermission.isDenied) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //             content: Text(
      //                 'Storage permission denied. Please allow access in settings.')),
      //       );
      //       await openAppSettings();
      //       return;
      //     }
      //   } else {
      //     if (storagePermission.isDenied) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text('Storage permission denied')),
      //       );
      //       return;
      //     }
      //   }
      // }

      // ✅ Lakukan Request Download File
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String path = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOAD);
        String filePath = '$path/$filename';
        logger.d('Saving file to: $filePath');

        // ✅ Simpan File
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File downloaded to $filePath')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to download file: ${response.statusCode}')),
        );
      }
    } catch (e) {
      logger.e("Download failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  //! sample to multple download
  // List<Map<String, String>> files = [
  //   {"url": "https://example.com/file1.pdf", "filename": "file1.pdf"},
  //   {"url": "https://example.com/file2.docx", "filename": "file2.docx"},
  // ];
  /// 🔹 Fungsi untuk mengunduh banyak file sekaligus
  /// 🔹 Mengunduh banyak file dengan indikator progress
  Future<void> downloadMultipleFiles(
      BuildContext context, List<FilesEPPGBMModel> files) async {
    try {
      // if (Platform.isAndroid) {
      //   if (await Permission.storage.request().isDenied ||
      //       await Permission.manageExternalStorage.request().isDenied) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text('Izin penyimpanan ditolak')));
      //     return;
      //   }
      // }

      ValueNotifier<double> progress = ValueNotifier(0.0);
      showLoadingDialog(context, progress);

      String? accessToken = await SharedPrefUtils().getAccessToken();

      if (accessToken == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal Mengambil Token')));
        Navigator.pushReplacementNamed(context, LOGIN);
      }

      Map<String, String> header = ApiUtils().headerWithToken(accessToken!);
      // String path = await ExternalPath.getExternalStoragePublicDirectory(
      //     ExternalPath.DIRECTORY_DOWNLOADS);
      String path = '/storage/emulated/0/Download';
      var dirDownloadExists = true;
      dirDownloadExists = await Directory(path).exists();
      if (!dirDownloadExists) {
        path = '/storage/emulated/0/Download';
        dirDownloadExists = await Directory(path).exists();
        if (!dirDownloadExists) {
          await Directory(path).create(recursive: true);
          logger.i(path);
        }
      }

      int totalFiles = files.length;

      for (int i = 0; i < totalFiles; i++) {
        var file = files[i];
        String filePath = '$path/${file.filename}.xlsx';

        var response = await http.get(Uri.parse(file.url), headers: header);
        if (response.statusCode == 200) {
          File saveFile = File(filePath);
          await saveFile.writeAsBytes(response.bodyBytes);
          logger.d('File berhasil diunduh: ${file.filename}');
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Semua file berhasil diunduh!')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal mengunduh: ${file.filename}')));
        }

        progress.value = (i + 1) / totalFiles;
      }

      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      logger.e("Gagal mengunduh banyak file: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Download gagal: $e')));
    }
  }

  void showLoadingDialog(BuildContext context, ValueNotifier<double> progress) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return AlertDialog(
        //   title: Text("Mengunduh File"),
        //   content: ValueListenableBuilder<double>(
        //     valueListenable: progress,
        //     builder: (context, value, child) {
        //       return Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           LinearProgressIndicator(value: value),
        //           SizedBox(height: 10),
        //           Text("${(value * 100).toInt()}% selesai"),
        //         ],
        //       );
        //     },
        //   ),
        // );
        return AlertDialog(
          scrollable: false,
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Download File E-PPGBM',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(23),
                ),
                Center(
                  child: Image(
                    width: 200,
                    image: AssetImage(imageOnProcces),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(24),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: progress,
                  builder: (context, value, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: backgroundWhite10,
                          color: bluePrimaryMain,
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(20),
                          value: value,
                        ),
                        SizedBox(height: 10),
                        Text("${(value * 100).toInt()}%"),
                        SizedBox(height: 4),
                        Text("Laporan Sedang Diunduh")
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
