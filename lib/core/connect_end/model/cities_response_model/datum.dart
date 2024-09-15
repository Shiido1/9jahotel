import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? name;
	int? hotels;

	Datum({this.id, this.name, this.hotels});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
