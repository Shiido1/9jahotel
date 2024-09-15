import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'password_update_response_model.g.dart';

@JsonSerializable()
class PasswordUpdateResponseModel {
	bool? success;
	String? message;
	Data? data;

	PasswordUpdateResponseModel({this.success, this.message, this.data});

	factory PasswordUpdateResponseModel.fromJson(Map<String, dynamic> json) {
		return _$PasswordUpdateResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PasswordUpdateResponseModelToJson(this);
}
