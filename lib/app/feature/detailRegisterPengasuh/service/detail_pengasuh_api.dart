import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailPengasuhApi {
  Future<List<dynamic>> detailPengasuh (String token, String id) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailPengasuh(id);

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

}