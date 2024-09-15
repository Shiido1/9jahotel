// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      promoPrice: (json['promo_price'] as num?)?.toInt(),
      promoStartDay: json['promo_start_day'] as String?,
      promoEndDay: json['promo_end_day'] as String?,
      weekendPrice: (json['weekend_price'] as num?)?.toInt(),
      weekendStartDay: json['weekend_start_day'] as String?,
      weekendEndDay: json['weekend_end_day'] as String?,
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'promo_price': instance.promoPrice,
      'promo_start_day': instance.promoStartDay,
      'promo_end_day': instance.promoEndDay,
      'weekend_price': instance.weekendPrice,
      'weekend_start_day': instance.weekendStartDay,
      'weekend_end_day': instance.weekendEndDay,
      'image': instance.image,
      'images': instance.images,
    };
