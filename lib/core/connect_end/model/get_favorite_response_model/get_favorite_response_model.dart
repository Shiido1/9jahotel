import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_favorite_response_model.g.dart';

@JsonSerializable()
class GetFavoriteResponseModel {
	List<Datum>? data;
	Links? links;
	Meta? meta;

	GetFavoriteResponseModel({this.data, this.links, this.meta});

	factory GetFavoriteResponseModel.fromJson(Map<String, dynamic> json) {
		return _$GetFavoriteResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetFavoriteResponseModelToJson(this);
}
