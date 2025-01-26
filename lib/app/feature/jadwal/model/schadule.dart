import 'package:json_annotation/json_annotation.dart';

part 'schadule.g.dart';

@JsonSerializable()
class Schadule {
    @JsonKey(name: "statusCode")
    final int statusCode;
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "meta")
    final Meta meta;

    Schadule({
        required this.statusCode,
        required this.message,
        required this.data,
        required this.meta,
    });

    Schadule copyWith({
        int? statusCode,
        String? message,
        List<Datum>? data,
        Meta? meta,
    }) => 
        Schadule(
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
        );

    factory Schadule.fromJson(Map<String, dynamic> json) => _$SchaduleFromJson(json);

    Map<String, dynamic> toJson() => _$SchaduleToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "name")
    final String name;
    @JsonKey(name: "time")
    final DateTime time;
    @JsonKey(name: "location")
    final String location;
    @JsonKey(name: "time_start")
    final String timeStart;
    @JsonKey(name: "time_end")
    final String timeEnd;
    @JsonKey(name: "createdAt")
    final DateTime createdAt;
    @JsonKey(name: "updatedAt")
    final DateTime updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.time,
        required this.location,
        required this.timeStart,
        required this.timeEnd,
        required this.createdAt,
        required this.updatedAt,
    });

    Datum copyWith({
        String? id,
        String? name,
        DateTime? time,
        String? location,
        String? timeStart,
        String? timeEnd,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? linkProduct,
        String? price,
        int? rating,
        String? shop,
        String? image,
        String? sold,
        String? category,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            time: time ?? this.time,
            location: location ?? this.location,
            timeStart: timeStart ?? this.timeStart,
            timeEnd: timeEnd ?? this.timeEnd,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Meta {
    @JsonKey(name: "page")
    final int page;
    @JsonKey(name: "limit")
    final int limit;
    @JsonKey(name: "schaduleCount")
    final int schaduleCount;
    @JsonKey(name: "pageCount")
    final int pageCount;
    @JsonKey(name: "hasPreviousPage")
    final bool hasPreviousPage;
    @JsonKey(name: "hasNextPage")
    final bool hasNextPage;

    Meta({
        required this.page,
        required this.limit,
        required this.schaduleCount,
        required this.pageCount,
        required this.hasPreviousPage,
        required this.hasNextPage,
    });

    Meta copyWith({
        int? page,
        int? limit,
        int? schaduleCount,
        int? pageCount,
        bool? hasPreviousPage,
        bool? hasNextPage,
    }) => 
        Meta(
            page: page ?? this.page,
            limit: limit ?? this.limit,
            schaduleCount: schaduleCount ?? this.schaduleCount,
            pageCount: pageCount ?? this.pageCount,
            hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
            hasNextPage: hasNextPage ?? this.hasNextPage,
        );

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

    Map<String, dynamic> toJson() => _$MetaToJson(this);
}
