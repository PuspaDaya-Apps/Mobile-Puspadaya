import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/reset_kata_sandi_model.dart';

class ResetKataSandiApi {
  Future<List<dynamic>> resetKataSandiService (ResetKataSandiModel resetKataSandiModel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlResetPassword();
    final String body = json.encode(resetKataSandiModel.toJson()); 

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}