import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'searched_hotels_response_model.g.dart';

@JsonSerializable()
class SearchedHotelsResponseModel {
	List<Datum>? data;
	Links? links;
	Meta? meta;

	SearchedHotelsResponseModel({this.data, this.links, this.meta});

	factory SearchedHotelsResponseModel.fromJson(Map<String, dynamic> json) {
		return _$SearchedHotelsResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchedHotelsResponseModelToJson(this);
}
