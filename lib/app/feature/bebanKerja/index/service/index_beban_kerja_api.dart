import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexBebanKerjaApi {
  Future<List<dynamic>> indexBebanKerjaService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetListBebanKerja();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }
}