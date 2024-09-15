// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponseModel _$CitiesResponseModelFromJson(Map<String, dynamic> json) =>
    CitiesResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitiesResponseModelToJson(
        CitiesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
