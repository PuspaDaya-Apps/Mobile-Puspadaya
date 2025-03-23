import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/simpan_tugas_kunjungan_ibu_hamil_model.dart';
import '../model/update_kunjungan_ibu_hamil_model.dart';

class FormTugasKunjunganIbuHamilApi {
  Future<List<dynamic>> postBuktiKunjunganService (String token, SimpanTugasKunjunganIbuHamilModel model) async {
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

  Future<List<dynamic>> getTugasKunjunganService (String token) async {
    final String link = ApiUtils().urlGetDataTugasKunjugan();
    final Map<String, dynamic> parameterQuery = {
      'jenis_tugas': 'Ibu Hamil Tidak Hadir',
      'limit': 100
    };

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> patchStatuskunjunganService (String token, String idKunjungan, UpdateKunjunganIbuHamilModel model) async {
    final String link = ApiUtils().urlPatchDataKunjungan(idKunjungan);
    final String body = json.encode(model.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getDetailKunjunganService (String token, String idKunjungan) async {
    final String link = ApiUtils().urlGetDetailKunjunganAnak(idKunjungan);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}