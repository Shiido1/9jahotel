import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? name;
	@JsonKey(name: 'walk_in_price') 
	int? walkInPrice;
	@JsonKey(name: 'promo_price') 
	int? promoPrice;
	@JsonKey(name: 'promo_start_day') 
	String? promoStartDay;
	@JsonKey(name: 'promo_end_day') 
	String? promoEndDay;
	@JsonKey(name: 'weekend_price') 
	int? weekendPrice;
	@JsonKey(name: 'available_rooms') 
	int? availableRooms;
	@JsonKey(name: 'weekend_start_day') 
	String? weekendStartDay;
	@JsonKey(name: 'weekend_end_day') 
	String? weekendEndDay;

	Datum({
		this.id, 
		this.name, 
		this.walkInPrice, 
		this.promoPrice, 
		this.promoStartDay, 
		this.promoEndDay, 
		this.weekendPrice, 
		this.availableRooms, 
		this.weekendStartDay, 
		this.weekendEndDay, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
