import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';

class RegisterAnakApi {
  Future<List<dynamic>> getAnakByPosyandu(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri url = ApiUtils().urlGetAnakPosyandu();

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
