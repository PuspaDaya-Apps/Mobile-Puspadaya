import 'dart:convert';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';

class LoginApi {
  Future<LoginResponseModel> loginService (LoginModel loginModel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlLogin();
    final String body = json.encode(loginModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return LoginResponseModel.fromJson(response);
    });
  }
}