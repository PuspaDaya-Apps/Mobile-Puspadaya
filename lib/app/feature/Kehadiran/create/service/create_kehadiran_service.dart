import 'dart:convert';

import 'package:puspadaya/app/feature/Kehadiran/create/model/get_all_anak_by_posyadu.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/get_all_ibu_hamil_by_posyandu.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/post_create_kehadiran_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class CreateKehadiranService {
  Future<dynamic> getAllAnakByPosyandu(String token, int limit) async {
    final String link = ApiUtils().urlGetAnakPosyandu(limit: limit);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri $link}');

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<int?> getTotalItemAnakPosyandu(String token) async {
    final String link = ApiUtils().urlGetAnakPosyandu();
    final Map<String, dynamic> parameterQuery = {};

    logger.d('URI: $link');

    try {
      final response =
          await NetworkUtils(token: token).get(link, parameterQuery);
      logger.d('Response: $response');

      // Parsing response ke model
      GetAllAnakByPosyandu dataAnak =
          GetAllAnakByPosyandu.fromJson(response[1]);

      // Mengembalikan total jumlah anak
      return dataAnak.meta
          .totalItems; // Pastikan 'total' adalah atribut yang benar dalam model
    } catch (e) {
      logger.e('Error fetching data: $e');
      return 0; // Mengembalikan 0 jika terjadi error
    }
  }

  // ibu hamil

  Future<dynamic> getAllIbuHamilByPosyandu(String token, int limit) async {
    final String link = ApiUtils().urlGetListIbuHamil(limit: limit);
    final Map<String, dynamic> parameterQuery = {};
    logger.d('uri $link}');

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }

  Future<int?> getTotalItemIbuHamilPosyandu(String token) async {
    final String link = ApiUtils().urlGetListIbuHamil();
    final Map<String, dynamic> parameterQuery = {};

    logger.d('URI: $link');

    try {
      final response =
          await NetworkUtils(token: token).get(link, parameterQuery);
      logger.d('Response: $response');

      // Parsing response ke model
      GetAllIbuHamilByPosyandu dataAnak =
          GetAllIbuHamilByPosyandu.fromJson(response[1]);

      // Mengembalikan total jumlah anak
      return dataAnak.meta
          .totalItems; // Pastikan 'total' adalah atribut yang benar dalam model
    } catch (e) {
      logger.e('Error fetching data: $e');
      return 0; // Mengembalikan 0 jika terjadi error
    }
  }

  Future<dynamic> postKehadiran(
      PostCreateKehadiranModel data, String accessToken) async {
    final String link = ApiUtils().urlPostDataKehadiranPosyandu();
    logger.d("Request Body: ${json.encode(data.toJson())}");
    final String body = json.encode(data.toJson());
    logger.d(body);

    return await NetworkUtils(token: accessToken)
        .post(link, body)
        .then((response) {
      logger.d(response.toString());
      return response;
    });
  }
}
