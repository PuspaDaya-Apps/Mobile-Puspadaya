import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../../login/model/lupa_kata_sandi_model.dart';
import '../model/kode_otp_model.dart';

class KodeOtpApi {
  Future<List<dynamic>> lupaKataSandiService (LupaKataSandiModel lupaKataSandiModel) async {
    final String link = ApiUtils().urlForgotPassword();
    final String body = json.encode(lupaKataSandiModel.toJson());

    return await NetworkUtils().post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> sendKodeOtpService (KodeOtpModel kodeOtpModel) async {
    final String link = ApiUtils().urlVerifyOTP();
    final String body = json.encode(kodeOtpModel.toJson());

    return await NetworkUtils().post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}