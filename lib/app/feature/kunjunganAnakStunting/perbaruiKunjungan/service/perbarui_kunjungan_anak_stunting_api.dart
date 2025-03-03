import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_anak_stunting_model.dart';

class PerbaruiKunjunganAnakStuntingApi {
  Future<List<dynamic>> postBuktiKunjunganService (String token, SimpanTugasKunjunganAnakStuntingModel model) async {
    final String link = ApiUtils().urlPostTugasBuktiKunjungan();
    final FormData data = model.toFormData();

    for (var file in model.files) {
      data.files.addAll([
        MapEntry("files", await MultipartFile.fromFile(file.path)),
      ]);
    }

    return await NetworkUtils(token: token).postFormData(link, data).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}