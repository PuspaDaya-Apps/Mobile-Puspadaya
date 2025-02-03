import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class RegisterOrangTuaApi {
  Future<List<dynamic>> getDetailAyahIbu(
      {required String token, required String ayahId}) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetDetailOrangTua(ayahId);
    logger.d('url = ${url}');
    try {
      final response = await NetworkUtils().get(url, header);
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}
