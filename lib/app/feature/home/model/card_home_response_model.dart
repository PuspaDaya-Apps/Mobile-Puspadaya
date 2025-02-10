import 'package:json_annotation/json_annotation.dart';

// part 'card_home_response_model.g.dart';

// @JsonSerializable()
class CardHomeResponseModel {
  String message;
  String? error;
  Data? data;
  

  CardHomeResponseModel({
    required this.message,
    this.error,
    this.data
  });

   factory CardHomeResponseModel.fromJson(Map<String, dynamic> json) => _$CardHomeResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CardHomeResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: 'jumlah_anak')
  ItemCard jumlahAnak;
  @JsonKey(name: 'jumlah_anak_stunting')
  ItemCard jumlahAnakStunting;
  @JsonKey(name: 'jumlah_anak_underweight')
  ItemCard jumlahAnakUnderweight;
  @JsonKey(name: 'jumlah_anak_wasting')
  ItemCard jumlahAnakWasting;
  @JsonKey(name: 'jumlah_ibu_hamil')
  ItemCard jumlahIbuHamil;

  Data({
    required this.jumlahAnak,
    required this.jumlahAnakStunting,
    required this.jumlahAnakUnderweight,
    required this.jumlahAnakWasting,
    required this.jumlahIbuHamil,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class ItemCard {
  int jumlah;
  String? status;
  int? rate;

  ItemCard({
    required this.jumlah,
    this.status,
    this.rate
  });

  factory ItemCard.fromJson(Map<String, dynamic> json) => _$ItemCardFromJson(json);

  Map<String, dynamic> toJson()=>_$ItemCardToJson(this);
}


CardHomeResponseModel _$CardHomeResponseModelFromJson(
        Map<String, dynamic> json) =>
    CardHomeResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardHomeResponseModelToJson(
        CardHomeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      jumlahAnak:
          ItemCard.fromJson(json['jumlah_anak'] as Map<String, dynamic>),
      jumlahAnakStunting: ItemCard.fromJson(
          json['jumlah_anak_stunting'] as Map<String, dynamic>),
      jumlahAnakUnderweight: ItemCard.fromJson(
          json['jumlah_anak_underweight'] as Map<String, dynamic>),
      jumlahAnakWasting: ItemCard.fromJson(
          json['jumlah_anak_wasting'] as Map<String, dynamic>),
      jumlahIbuHamil:
          ItemCard.fromJson(json['jumlah_ibu_hamil'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'jumlah_anak': instance.jumlahAnak,
      'jumlah_anak_stunting': instance.jumlahAnakStunting,
      'jumlah_anak_underweight': instance.jumlahAnakUnderweight,
      'jumlah_anak_wasting': instance.jumlahAnakWasting,
      'jumlah_ibu_hamil': instance.jumlahIbuHamil,
    };

ItemCard _$ItemCardFromJson(Map<String, dynamic> json) => ItemCard(
      jumlah: (json['jumlah'] as num).toInt(),
      status: json['status'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemCardToJson(ItemCard instance) => <String, dynamic>{
      'jumlah': instance.jumlah,
      'status': instance.status,
      'rate': instance.rate,
    };
