import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class RegisterOrangTuaApi {
  Future<List<dynamic>> getDataAyahIbu(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urGetListOrangTua();

    try {
      final response = await NetworkUtils().get(url, header);
      logger.d(response.toString());
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
}
