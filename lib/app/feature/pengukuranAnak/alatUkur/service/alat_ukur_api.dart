import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class AlatUkurApi {
  Future<List<dynamic>> getAlatUkurService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetListAlatUkurKader();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}