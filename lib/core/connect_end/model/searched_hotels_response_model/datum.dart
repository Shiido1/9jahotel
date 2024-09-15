import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? name;
	String? code;
	String? reviews;
	@JsonKey(name: 'walk_in_price') 
	dynamic walkInPrice;
	@JsonKey(name: 'online_price') 
	int? onlinePrice;
	String? address;
	String? rating;
	String? image;

	Datum({
		this.id, 
		this.name, 
		this.code, 
		this.reviews, 
		this.walkInPrice, 
		this.onlinePrice, 
		this.address, 
		this.rating, 
		this.image, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
