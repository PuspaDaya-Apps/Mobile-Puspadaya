import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class RegisterOrangTuaApi {
  Future<List<dynamic>> getDetailAyahIbu({required String token, required String ayahId}) async {

    final String url = ApiUtils().urlGetDetailOrangTua(ayahId);
    final Map<String, dynamic> parameterQuery = {};

    logger.d('url = ${url}');
    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}
