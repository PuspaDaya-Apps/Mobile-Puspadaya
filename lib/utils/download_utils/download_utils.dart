import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
import '../logger/logger.dart';

class DownloadUtils {
  Future<void> downloadAndSaveFile(BuildContext context, String url, String filename) async {
    try {
      // Request storage permission (for Android 13+, need manage storage permission)
      if (Platform.isAndroid) {
        if (await Permission.storage.request().isDenied ||
            await Permission.manageExternalStorage.request().isDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission denied')),
          );
          return;
        }
      }

      // Make the HTTP request to download the file
      var response = await http.get(Uri.parse(url));

      // Check if the response is successful
      if (response.statusCode == 200) {
        String path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);

        String filePath = '${path}/$filename';
        logger.d('Saving file to: $filePath');

        // Write the file
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File downloaded to $filePath')),
        );
      } else {
        // Handle the error if the response is not successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download file: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Handle any errors
      logger.e("Download failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }
}
