import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_hotel_categories_response_model.g.dart';

@JsonSerializable()
class GetHotelCategoriesResponseModel {
	bool? success;
	String? message;
	List<Datum>? data;

	GetHotelCategoriesResponseModel({this.success, this.message, this.data});

	factory GetHotelCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$GetHotelCategoriesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() {
		return _$GetHotelCategoriesResponseModelToJson(this);
	}
}
