import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  bool? success;
  String? message;
  Data? data;

  RegisterResponseModel({this.success, this.message, this.data});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
