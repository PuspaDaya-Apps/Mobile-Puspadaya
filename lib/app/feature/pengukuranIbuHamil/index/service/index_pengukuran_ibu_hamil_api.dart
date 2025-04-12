import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexPengukuranIbuHamilApi {
  Future<List<dynamic>> getpengukuranIbuHamilService (String token) async {
    final String link = ApiUtils().urlGetListPengukuranIbuHamil();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}