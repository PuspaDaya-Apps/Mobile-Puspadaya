import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/login_model.dart';

class LoginApi {
  Future<List<dynamic>> loginService (LoginModel loginModel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlLogin();
    final String body = json.encode(loginModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
  
  Future<List<dynamic>> getCurrentUserService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlCurrentUser();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}