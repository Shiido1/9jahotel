import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'room_image_response_model.g.dart';

@JsonSerializable()
class RoomImageResponseModel {
	bool? success;
	String? message;
	List<Datum>? data;

	RoomImageResponseModel({this.success, this.message, this.data});

	factory RoomImageResponseModel.fromJson(Map<String, dynamic> json) {
		return _$RoomImageResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RoomImageResponseModelToJson(this);
}
