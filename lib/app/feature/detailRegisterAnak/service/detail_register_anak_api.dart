import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class DetailRegisterAnakApi {
  Future<List<dynamic>> getDetailAnak(
      {required String token, required String anakId}) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetDetailAnak(anakId);
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
