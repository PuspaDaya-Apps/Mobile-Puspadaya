import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailAlatUkurService {

  Future<dynamic> getDetailAlatUkurPosyandu(String idAlatUkur, String token) async {
    final String link = ApiUtils().urlGetDetailAlatUkurKader(idAlatUkur);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<dynamic> deleteAlatUkurById(String token,String id) async{
    final String link = ApiUtils().urlDeleteDataAlatUkurKader(id);
     final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
