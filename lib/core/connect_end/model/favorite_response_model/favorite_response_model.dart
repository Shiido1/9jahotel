import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'favorite_response_model.g.dart';

@JsonSerializable()
class FavoriteResponseModel {
	bool? success;
	String? message;
	Data? data;

	FavoriteResponseModel({this.success, this.message, this.data});

	factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
		return _$FavoriteResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$FavoriteResponseModelToJson(this);
}
