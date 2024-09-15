// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResponseModel _$FavoriteResponseModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteResponseModelToJson(
        FavoriteResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
