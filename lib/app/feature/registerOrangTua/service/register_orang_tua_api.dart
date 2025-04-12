import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class RegisterOrangTuaApi {
  Future<List<dynamic>> getDataAyahIbu(String token) async {
    final String url = ApiUtils().urlGetListOrangTua();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}
