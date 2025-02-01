// import 'package:json_annotation/json_annotation.dart';

import '../../../model/current_user_model.dart';

// part 'get_current_user_response_model.g.dart';

// @JsonSerializable()
class GetCurrentUserResponseModel {
  String message;
  CurrentUserModel? data;

  GetCurrentUserResponseModel({
    required this.message,
    this.data
  });

   factory GetCurrentUserResponseModel.fromJson(Map<String, dynamic> json) => _$GetCurrentUserResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetCurrentUserResponseModelToJson(this);
}

GetCurrentUserResponseModel _$GetCurrentUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCurrentUserResponseModel(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CurrentUserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCurrentUserResponseModelToJson(
        GetCurrentUserResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };