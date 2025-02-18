import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/login_model.dart';
import '../model/lupa_kata_sandi_model.dart';

class LoginApi {
  Future<List<dynamic>> loginService (LoginModel loginModel) async {
    debugPrint('api service');
    final String link = ApiUtils().urlLogin();
    final String body = json.encode(loginModel.toJson());

    return await NetworkUtils().post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
  
  Future<List<dynamic>> getCurrentUserService (String token) async {
    final String link = ApiUtils().urlCurrentUser();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> lupaKataSandiService (LupaKataSandiModel lupaKataSandiModel) async {
    final String link = ApiUtils().urlForgotPassword();
    final String body = json.encode(lupaKataSandiModel.toJson());

    return await NetworkUtils().post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}