// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      reviews: json['reviews'] as String?,
      walkInPrice: (json['walk_in_price'] as num?)?.toInt(),
      onlinePrice: (json['online_price'] as num?)?.toInt(),
      address: json['address'] as String?,
      rating: json['rating'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'reviews': instance.reviews,
      'walk_in_price': instance.walkInPrice,
      'online_price': instance.onlinePrice,
      'address': instance.address,
      'rating': instance.rating,
      'image': instance.image,
    };
