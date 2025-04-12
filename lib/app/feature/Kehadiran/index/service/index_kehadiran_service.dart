import 'package:puspadaya/utils/api_utils/api_utils.dart';
import 'package:puspadaya/utils/network_utils/network_utils.dart';

import '../../../../../utils/logger/logger.dart';

class IndexKehadiranService {
  Future<List<dynamic>> getAllKehadiran(
      String token) async {
    final String link = ApiUtils().urlGetListKehadiranPosyandu();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
