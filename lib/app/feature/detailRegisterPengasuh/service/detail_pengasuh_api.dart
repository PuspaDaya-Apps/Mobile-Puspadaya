import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailPengasuhApi {
  Future<List<dynamic>> detailPengasuh (String token, String id) async {
    final String link = ApiUtils().urlGetDetailPengasuh(id);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}