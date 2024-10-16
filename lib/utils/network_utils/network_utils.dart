import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
// import "package:image_picker/image_picker.dart";

class NetworkUtils{

  Future<dynamic> get(Uri url, Map<String, String> header) async {
    return http.get(url, headers: header).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 
      ) {
        return json.decode(bodyResponse);
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }

  Future<dynamic> post(Uri url, Map<String, String> header, String body) async {
    return http.post(url, headers: header, body: body).then((http.Response response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 ||
         statusResponse == 422 ||
         statusResponse == 409
      ) {
        return json.decode(bodyResponse);
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }

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
  
  Future<dynamic> put(Uri url, Map<String, String> header, String body) async {
    return http.put(url, headers: header, body: body).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 ||
         statusResponse == 422
      ) {
        return json.decode(bodyResponse);
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }

  Future<dynamic> delete(Uri url, Map<String, String> header, String body) async {
    return http.delete(url,headers: header, body: body).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 
      ) {
        return json.decode(bodyResponse);
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }
}