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
}
