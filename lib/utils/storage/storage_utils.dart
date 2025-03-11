import '../api_utils/api_utils.dart';
import '../logger/logger.dart';
import '../network_utils/network_utils.dart';

class StorageUtils {
  Future<String> getImageFromStorage(String token,String path) async {

    final String link = ApiUtils().urlGetImageFromStorage(path);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('link $link}');
    await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response[1];
    });
    return link;
  }
}
