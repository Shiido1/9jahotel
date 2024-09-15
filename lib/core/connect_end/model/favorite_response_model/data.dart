import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'hotel_id')
  int? hotelId;
  @JsonKey(name: 'customer_id')
  int? customerId;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;

  Data({
    this.hotelId,
    this.customerId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
