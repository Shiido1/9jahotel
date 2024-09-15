import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'cities_response_model.g.dart';

@JsonSerializable()
class CitiesResponseModel {
	List<Datum>? data;
	Links? links;
	Meta? meta;

	CitiesResponseModel({this.data, this.links, this.meta});

	factory CitiesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$CitiesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CitiesResponseModelToJson(this);
}
