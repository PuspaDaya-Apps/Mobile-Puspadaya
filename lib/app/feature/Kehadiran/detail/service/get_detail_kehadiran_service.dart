import 'dart:convert';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class GetDetailKehadiranService {


  Future<dynamic> getDetailKehadiran(String id, String token) async {
    final String link = ApiUtils().urlGetDetailKehadiranPosyandu(id);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri ${link}}');

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
  Future<dynamic> deleteKehadiran(String token,String id) async{
    final String link = ApiUtils().urlDeleteDataKehadiranPosyandu(id);
     final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}