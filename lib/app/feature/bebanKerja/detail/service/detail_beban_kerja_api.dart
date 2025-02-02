import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailBebanKerjaApi {
  Future<List<dynamic>> detailBebanKerjaService (String token, String bebanKerjaId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailBebanKerja(bebanKerjaId);

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> hapusBebanKerjaService (String token, String bebanKerjaId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlDeleteDataBebanKerja(bebanKerjaId);

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}