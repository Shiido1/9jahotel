import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? url;
  @JsonKey(name: 'room_number')
  String? roomNumber;

  Datum({this.id, this.url, this.roomNumber});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
