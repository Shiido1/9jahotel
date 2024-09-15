// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hotel_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHotelCategoriesResponseModel _$GetHotelCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetHotelCategoriesResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHotelCategoriesResponseModelToJson(
        GetHotelCategoriesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
