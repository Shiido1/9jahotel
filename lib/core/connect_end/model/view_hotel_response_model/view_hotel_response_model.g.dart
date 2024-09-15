// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_hotel_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewHotelResponseModel _$ViewHotelResponseModelFromJson(
        Map<String, dynamic> json) =>
    ViewHotelResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      reviews: json['reviews'] as String?,
      walkInPrice: (json['walk_in_price'] as num?)?.toInt(),
      onlinePrice: (json['online_price'] as num?)?.toInt(),
      address: json['address'] as String?,
      rating: json['rating'] as String?,
      image: json['image'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewHotelResponseModelToJson(
        ViewHotelResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'reviews': instance.reviews,
      'walk_in_price': instance.walkInPrice,
      'online_price': instance.onlinePrice,
      'address': instance.address,
      'rating': instance.rating,
      'image': instance.image,
      'categories': instance.categories,
    };
