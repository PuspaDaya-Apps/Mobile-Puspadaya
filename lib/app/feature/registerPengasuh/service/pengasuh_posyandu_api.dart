import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class PengasuhPosyanduApi {
  Future<List<dynamic>> getPengasuhByPosyandu(String token) async {
    final String url = ApiUtils().urlGetPengasuhPosyandu();
    final Map<String, dynamic> parameterQuery = {};

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
