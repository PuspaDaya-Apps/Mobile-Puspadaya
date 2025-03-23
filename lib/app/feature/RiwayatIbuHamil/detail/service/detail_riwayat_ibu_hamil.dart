import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailRiwayatIbuHamil {
  Future<dynamic> getDetailRiwayatPengukuranIbuHamil(
      String idRiwayat, String token) async {
    final String link =
        ApiUtils().urlGetDetailRiwayatPengukuranIbuHamil(idRiwayat);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
