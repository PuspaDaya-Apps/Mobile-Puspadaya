import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../app/feature/eppgbm/view/files_eppgbm_model.dart';
import '../../app/view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../config/screen_config/image_config.dart';
import '../../config/screen_config/size_config.dart';
import '../../config/theme/text_style.dart';
import '../../route/route_name.dart';
import '../api_utils/api_utils.dart';
import '../logger/logger.dart';
import '../shared_preferences_utils/shared_preferences_utils.dart';

class DownloadUtils {
  static Future<void> requestStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 30) {
        // Android 11 ke atas
        if (!await Permission.manageExternalStorage.isGranted) {
          final status = await Permission.manageExternalStorage.request();
          if (!status.isGranted) {
            // Harus arahkan ke Settings
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().warning(
                  'Akses penyimpanan penuh diperlukan. Buka pengaturan.'),
            );
            await openAppSettings();
            return;
          }
        }
      } else {
        // Android 10 ke bawah
        if (!await Permission.storage.isGranted) {
          final status = await Permission.storage.request();
          if (!status.isGranted) {
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().error('Izin Penyimpanan Ditolak'),
            );
            return;
          }
        }
      }
    }
  }

  static Future<String> getExternalDocumentPath(BuildContext context) async {
    // To check whether permission is given for this app or not.
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await requestStoragePermission(context);
      // Permission not granted, ask for permission first
      await Permission.storage.request();
    }
    Directory _directory = Directory("");

    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      _directory = Directory("/storage/emulated/0/Download");
    }

    if (Platform.isIOS) {
      _directory = (await getDownloadsDirectory())!;
    }

    final exPath = _directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);

    return exPath;
  }

  Future<void> downloadAndSaveFile(
      BuildContext context, String url, String filename) async {
    try {
      showDownloadProgressDialog(context, 'Sedang mengunduh Parameter Gizi');
      // ✅ Lakukan Request Download File
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String path = await getExternalDocumentPath(context);
        // String path = await ExternalPath.getExternalStoragePublicDirectory(
        // ExternalPath.DIRECTORY_DOWNLOAD);
        String filePath = '$path/$filename';
        logger.d('Saving file to: $filePath');

        // ✅ Simpan File
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().success('Berhasil Mengunduh Parameter Gizi'),
        );
        Navigator.pop(context);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('File downloaded to $filePath')),
        // );
      } else {
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget()
              .error('Gagal Mengunduh Parameter Gizi ${response.statusCode}'),
        );
      }
    } catch (e) {
      logger.e("Download failed: $e");
      showTopSnackBar(
        Overlay.of(context),
        animationDuration: const Duration(milliseconds: 600),
        displayDuration: const Duration(milliseconds: 2200),
        reverseAnimationDuration: const Duration(milliseconds: 300),
        TopSnackbarWidget()
            .error('Gagal Mengunduh Parameter Gizi ${e.toString()}'),
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
      bool isSuccess = false;
      String? accessToken = await SharedPrefUtils().getAccessToken();

      if (accessToken == null) {
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().error('Gagal Mengambil Token'),
        );

        Navigator.pushReplacementNamed(context, LOGIN);
      }

      Map<String, String> header = ApiUtils().headerWithToken(accessToken!);
      // String path = await ExternalPath.getExternalStoragePublicDirectory(
      //     ExternalPath.DIRECTORY_DOWNLOADS);
      String path = await getExternalDocumentPath(context);
      // String path = '/storage/emulated/0/Download';
      var dirDownloadExists = true;
      dirDownloadExists = await Directory(path).exists();
      if (!dirDownloadExists) {
        // path = '/storage/emulated/0/Download';
        dirDownloadExists = await Directory(path).exists();
        if (!dirDownloadExists) {
          await Directory(path).create(recursive: true);
          logger.i(path);
        }
      }

      int totalFiles = files.length;
      int successCount = 0;
      int failedCount = 0;

      for (int i = 0; i < totalFiles; i++) {
        var file = files[i];
        String filePath = '$path/${file.filename}.xlsx';

        var response = await http.get(Uri.parse(file.url), headers: header);
        if (response.statusCode == 200) {
          File saveFile = File(filePath);
          await saveFile.writeAsBytes(response.bodyBytes);
          logger.d('File berhasil diunduh: ${file.filename}');
          successCount++;
        } else {
          failedCount++;
        }

        progress.value = (i + 1) / totalFiles;
      }
      if (successCount == totalFiles) {
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().success('Berhasil Mengunduh Parameter Gizi'),
        );
      } else if (successCount > 0 && failedCount > 0) {
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().error(
              'Ada ${successCount} file berhasil diunduh dan ${failedCount} file gagal diunduh'),
        );
      } else {
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget()
              .error('Gagal mengunduh semua file, silakan coba lagi'),
        );
      }

      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      logger.e("Gagal mengunduh banyak file: $e");
      showTopSnackBar(
        Overlay.of(context),
        animationDuration: const Duration(milliseconds: 600),
        displayDuration: const Duration(milliseconds: 2200),
        reverseAnimationDuration: const Duration(milliseconds: 300),
        TopSnackbarWidget().error('Gagal mengunduh: ${e.toString()}'),
      );
    }
  }

  void showLoadingDialog(BuildContext context, ValueNotifier<double> progress) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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

  static void showDownloadProgressDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                    'Mengunduh File',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(20),
                ),
                SizedBox(
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: 40.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(24),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
