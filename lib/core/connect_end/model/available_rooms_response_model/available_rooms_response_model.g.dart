// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_rooms_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableRoomsResponseModel _$AvailableRoomsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AvailableRoomsResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableRoomsResponseModelToJson(
        AvailableRoomsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
