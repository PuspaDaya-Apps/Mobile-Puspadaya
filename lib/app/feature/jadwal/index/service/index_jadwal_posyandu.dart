import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class IndexJadwalPosyandu {
  Future<List<dynamic>> getAllJadwalPosyandu(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetListJadwalPosyandu();

    return await NetworkUtils().get(link, header).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
