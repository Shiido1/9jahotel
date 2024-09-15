import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  String? name;
  int? price;
  @JsonKey(name: 'promo_price')
  int? promoPrice;
  @JsonKey(name: 'promo_start_day')
  String? promoStartDay;
  @JsonKey(name: 'promo_end_day')
  String? promoEndDay;
  @JsonKey(name: 'weekend_price')
  int? weekendPrice;
  @JsonKey(name: 'weekend_start_day')
  String? weekendStartDay;
  @JsonKey(name: 'weekend_end_day')
  String? weekendEndDay;
  String? image;
  List<String>? images;

  Category({
    this.id,
    this.name,
    this.price,
    this.promoPrice,
    this.promoStartDay,
    this.promoEndDay,
    this.weekendPrice,
    this.weekendStartDay,
    this.weekendEndDay,
    this.image,
    this.images,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
