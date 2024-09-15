import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'available_rooms_response_model.g.dart';

@JsonSerializable()
class AvailableRoomsResponseModel {
	bool? success;
	String? message;
	List<Datum>? data;

	AvailableRoomsResponseModel({this.success, this.message, this.data});

	factory AvailableRoomsResponseModel.fromJson(Map<String, dynamic> json) {
		return _$AvailableRoomsResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AvailableRoomsResponseModelToJson(this);
}
