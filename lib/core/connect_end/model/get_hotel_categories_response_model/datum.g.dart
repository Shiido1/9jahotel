// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      walkInPrice: (json['walk_in_price'] as num?)?.toInt(),
      promoPrice: (json['promo_price'] as num?)?.toInt(),
      promoStartDay: json['promo_start_day'] as String?,
      promoEndDay: json['promo_end_day'] as String?,
      weekendPrice: (json['weekend_price'] as num?)?.toInt(),
      availableRooms: (json['available_rooms'] as num?)?.toInt(),
      weekendStartDay: json['weekend_start_day'] as String?,
      weekendEndDay: json['weekend_end_day'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'walk_in_price': instance.walkInPrice,
      'promo_price': instance.promoPrice,
      'promo_start_day': instance.promoStartDay,
      'promo_end_day': instance.promoEndDay,
      'weekend_price': instance.weekendPrice,
      'available_rooms': instance.availableRooms,
      'weekend_start_day': instance.weekendStartDay,
      'weekend_end_day': instance.weekendEndDay,
    };
