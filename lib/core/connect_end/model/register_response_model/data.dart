import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? firstname;
	String? lastname;
	String? email;
	String? phone;
	@JsonKey(name: 'hotels_booked') 
	int? hotelsBooked;
	@JsonKey(name: 'days_booked') 
	dynamic daysBooked;
	dynamic cities;

	Data({
		this.id, 
		this.firstname, 
		this.lastname, 
		this.email, 
		this.phone, 
		this.hotelsBooked, 
		this.daysBooked, 
		this.cities, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
