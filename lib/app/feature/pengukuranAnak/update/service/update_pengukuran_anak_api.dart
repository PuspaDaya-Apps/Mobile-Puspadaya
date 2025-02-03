
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../../create/model/pengukuran_anak_model.dart';

class UpdatePengukuranAnakApi {
    Future<List<dynamic>> updatePengukuranAnakService (String token, PengukuranAnakModel pengukuranAnakModel, String pengukuranId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPatchDataPengukuranAnak(pengukuranId);
    final String body = json.encode(pengukuranAnakModel.toJson());

    return await NetworkUtils().patch(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}