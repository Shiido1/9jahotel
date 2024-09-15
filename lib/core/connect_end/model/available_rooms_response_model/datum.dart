import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? number;
  @JsonKey(name: 'walk_in_price')
  int? walkInPrice;
  @JsonKey(name: 'online_price')
  int? onlinePrice;
  String? type;
  @JsonKey(name: 'is_available')
  bool? isAvailable;
  String? character;
  String? floor;
  @JsonKey(name: 'bed_type')
  String? bedType;

  Datum({
    this.id,
    this.number,
    this.walkInPrice,
    this.onlinePrice,
    this.type,
    this.isAvailable,
    this.character,
    this.floor,
    this.bedType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
