import 'package:json_annotation/json_annotation.dart';

part 'example_model.g.dart';

// @JsonSerializable()
class Example{
  @JsonKey(name:'example_id')
  int id;
  @JsonKey(name: 'example_name')
  String nama;
  @JsonKey(name: 'description')
  List<String> deskripsi = [];

  Example({
    required this.id,
    required this.nama,
    required this.deskripsi
  });

    factory Example.fromJson(Map<String, dynamic> json) => _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}