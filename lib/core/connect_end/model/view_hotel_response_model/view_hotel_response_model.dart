import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'view_hotel_response_model.g.dart';

@JsonSerializable()
class ViewHotelResponseModel {
	int? id;
	String? name;
	String? code;
	String? reviews;
	@JsonKey(name: 'walk_in_price') 
	int? walkInPrice;
	@JsonKey(name: 'online_price') 
	int? onlinePrice;
	String? address;
	String? rating;
	String? image;
	List<Category>? categories;

	ViewHotelResponseModel({
		this.id, 
		this.name, 
		this.code, 
		this.reviews, 
		this.walkInPrice, 
		this.onlinePrice, 
		this.address, 
		this.rating, 
		this.image, 
		this.categories, 
	});

	factory ViewHotelResponseModel.fromJson(Map<String, dynamic> json) {
		return _$ViewHotelResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ViewHotelResponseModelToJson(this);
}
