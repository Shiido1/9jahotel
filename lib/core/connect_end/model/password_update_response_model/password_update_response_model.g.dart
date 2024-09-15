// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordUpdateResponseModel _$PasswordUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    PasswordUpdateResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PasswordUpdateResponseModelToJson(
        PasswordUpdateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
