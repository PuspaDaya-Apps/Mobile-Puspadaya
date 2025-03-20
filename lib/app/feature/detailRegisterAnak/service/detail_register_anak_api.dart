import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class DetailRegisterAnakApi {
  Future<List<dynamic>> getDetailAnak({required String token, required String anakId}) async {
    final String url = ApiUtils().urlGetDetailAnak(anakId);
    final Map<String, dynamic> parameterQuery = {};

    try {
      final response = await NetworkUtils(token: token).get(url, parameterQuery);
      return response;
    } catch (e) {
      logger.e("Error fetching data: $e");
      return [];
    }
  }
  Future<dynamic> getGrafikKMS(String idAnak, String token) async {
    final String link = ApiUtils().urlGetGrafikKMS(idAnak);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
