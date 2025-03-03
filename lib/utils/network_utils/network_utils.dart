import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import "package:puspadaya/utils/shared_preferences_utils/shared_preferences_utils.dart";

import "../../app/model/refreshtoken_model.dart";
import "../api_utils/api_utils.dart";
// import "package:image_picker/image_picker.dart";


class NetworkUtils {
  String? token;
  late Dio dio;

  NetworkUtils({
    this.token
  }) {
    dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        responseType: ResponseType.json,
        validateStatus: (status) => true        
      )
    );
  
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        debugPrint('Set Header');
        //! header
        if(token == null) {
          debugPrint('header no token');
          options.headers = {
            'Content-Type': 'application/json', 
            'Accept': 'application/json'
          };
        } else {
          debugPrint('header token');
          // options.headers['Authorization'] = 'Bearer $token';
          options.headers = { 
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          };
        }
        debugPrint('send header');
        handler.next(options);
      },
      onError: (DioException e, handler) async {
        debugPrint('something error');
        if (e.response?.statusCode == 401) {
          debugPrint('access token refresh');
          await refreshToken();
        }

        handler.next(e);
      },
    ));
  }

  Future<List<dynamic>> refreshToken () async {
    String? refreshTokenValue = await SharedPrefUtils().getRefreshToken();

    RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(json.decode(refreshTokenValue!));

    try {
      final response = await dio.post(
        ApiUtils().urlRefreshToken(),
        data: {
          "refresh_token" : refreshTokenModel.refreshToken
        }
      );

        final bodyResponse = response.data;
        final int statusResponse = response.statusCode!;

        debugPrint(bodyResponse['message'].toString());
        debugPrint(statusResponse.toString());

        if (statusResponse == 200 ||
            statusResponse == 201 ||
            statusResponse == 202 ||
            statusResponse == 206 ||
            statusResponse == 401 ||
            statusResponse == 403 ||
            statusResponse == 404 ||
            statusResponse == 400 ||
            statusResponse == 422 ||
            statusResponse == 409) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      }
    } on DioException catch (e) {
      throw e.response!.statusMessage.toString();
    }
    }

  Future<List<dynamic>> get (String url, Map<String, dynamic> parameterQuery) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: parameterQuery
      );

      final bodyResponse = response.data;
      final int statusResponse = response.statusCode!;

      debugPrint(bodyResponse.toString());
      debugPrint(statusResponse.toString());
      
      if (statusResponse == 200 ||
          statusResponse == 201 ||
          statusResponse == 202 ||
          statusResponse == 206 ||
          statusResponse == 403 ||
          statusResponse == 404 ||
          statusResponse == 400) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      }
    } on DioException catch (e) {
      throw e.response!.statusMessage.toString();
    }
  }

  Future<List<dynamic>> post (String url, String body) async {
    debugPrint("start connection");
    try {
      final response = await dio.post(
        url,
        data: body
      );
      debugPrint(" procces connection");

      final bodyResponse = response.data;
      final int statusResponse = response.statusCode!;

      debugPrint(bodyResponse['message'].toString());
      debugPrint(statusResponse.toString());

      if(statusResponse == 401) {
        debugPrint('error test access token');
      }

      if (statusResponse == 200 ||
          statusResponse == 201 ||
          statusResponse == 202 ||
          statusResponse == 206 ||
          // statusResponse == 401 ||
          statusResponse == 403 ||
          statusResponse == 404 ||
          statusResponse == 400 ||
          statusResponse == 422 ||
          statusResponse == 409) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        throw bodyResponse['message'].toString();
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw e.response!.statusMessage.toString();
    }
  }

  Future<List<dynamic>> postFormData (String url, FormData body) async {
    debugPrint("start connection");
    try {
      final response = await dio.post(
        url,
        data: body
      );
      debugPrint(" procces connection");

      final bodyResponse = response.data;
      final int statusResponse = response.statusCode!;

      debugPrint(bodyResponse['message'].toString());
      debugPrint(statusResponse.toString());

      if(statusResponse == 401) {
        debugPrint('error test access token');
      }

      if (statusResponse == 200 ||
          statusResponse == 201 ||
          statusResponse == 202 ||
          statusResponse == 206 ||
          // statusResponse == 401 ||
          statusResponse == 403 ||
          statusResponse == 404 ||
          statusResponse == 400 ||
          statusResponse == 422 ||
          statusResponse == 409) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        throw bodyResponse['message'].toString();
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw e.response!.statusMessage.toString();
    }
  }

  Future<List<dynamic>> put (String url, String body) async {
    try {
      final response = await dio.put(
        url,
        data: body
      );

        final bodyResponse = response.data;
        final int statusResponse = response.statusCode!;

        debugPrint(bodyResponse.toString());
        debugPrint(statusResponse.toString());

        if (statusResponse == 200 ||
            statusResponse == 201 ||
            statusResponse == 202 ||
            statusResponse == 206 ||
            statusResponse == 401 ||
            statusResponse == 403 ||
            statusResponse == 404 ||
            statusResponse == 400 ||
            statusResponse == 422 ||
            statusResponse == 409) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      }
    } on DioException catch (e) {
      throw e.response!.statusMessage.toString();
    }
  }

  Future<List<dynamic>> patch (String url, String body) async {
    try {
      final response = await dio.patch(
        url,
        data: body
      );

        final bodyResponse = response.data;
        final int statusResponse = response.statusCode!;

        debugPrint(bodyResponse.toString());
        debugPrint(statusResponse.toString());

        if (statusResponse == 200 ||
            statusResponse == 201 ||
            statusResponse == 202 ||
            statusResponse == 206 ||
            statusResponse == 401 ||
            statusResponse == 403 ||
            statusResponse == 404 ||
            statusResponse == 400 ||
            statusResponse == 422) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      }
    } on DioException catch (e) {
      throw e.response!.statusMessage.toString();
    }
  }

  Future<List<dynamic>> delete (String url, String body) async {
    try {
      final response = await dio.delete(
        url,
        data: body
      );

        final bodyResponse = response.data;
        final int statusResponse = response.statusCode!;

        debugPrint(bodyResponse.toString());
        debugPrint(statusResponse.toString());

        if (statusResponse == 200 ||
            statusResponse == 201 ||
            statusResponse == 202 ||
            statusResponse == 206 ||
            statusResponse == 401 ||
            statusResponse == 403 ||
            statusResponse == 404 ||
            statusResponse == 400 ) {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      } else {
        return [statusResponse, json.decode(json.encode(bodyResponse))];
      }
    } on DioException catch (e) {
      throw e.response!.statusMessage.toString();
    }
  }

  // Future<List<dynamic>> donwloadFile  (String url, String body) async {
  //   try {
  //     final response = await dio.download(
  //       url,
  //       data: body
  //     );

  //       final bodyResponse = response.data;
  //       final int statusResponse = response.statusCode!;

  //       debugPrint(bodyResponse.toString());
  //       debugPrint(statusResponse.toString());

  //       if (statusResponse == 200 ||
  //           statusResponse == 201 ||
  //           statusResponse == 202 ||
  //           statusResponse == 206 ||
  //           statusResponse == 401 ||
  //           statusResponse == 403 ||
  //           statusResponse == 404 ||
  //           statusResponse == 400 ) {
  //       return [statusResponse, json.decode(json.encode(bodyResponse))];
  //     } else {
  //       return [statusResponse, json.decode(json.encode(bodyResponse))];
  //     }
  //   } on DioException catch (e) {
  //     throw e.response!.statusMessage.toString();
  //   }
  // }

  // Future<dynamic> postMultiPart(Uri url, Map<String, String> header, Map<String, String> form, XFile? file) async {
  //   final http.MultipartRequest request = http.MultipartRequest("POST", url)
  //   ..headers.addAll(header)
  //   ..fields.addAll(form);
  //   if(file != null) {
  //     request.files.add( await http.MultipartFile.fromPath('avatar', file.path));
  //   }

  //   final res = await request.send();
  //   final resBody = await res.stream.bytesToString();

  //   debugPrint("status code: ${res.statusCode}");
  //   debugPrint("body: $resBody");

  //   if(res.statusCode == 200 ||
  //     res.statusCode == 201 ||
  //     res.statusCode == 202 ||
  //     res.statusCode == 206 ||
  //     res.statusCode == 401 ||
  //     res.statusCode == 403 ||
  //     res.statusCode == 400 ||
  //     res.statusCode == 422
  //   ) {
  //     return json.decode(resBody);
  //   } else {
  //     return throw Exception('Error while fetching data or Your session has expired');
  //   }
  // }

}
