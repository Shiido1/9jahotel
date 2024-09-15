class SearchedHotelsEntityModel {
  String? checkedIn;
  String? checkedOut;
  String? cityId;

  SearchedHotelsEntityModel({this.checkedIn, this.checkedOut, this.cityId});

  factory SearchedHotelsEntityModel.fromJson(Map<String, dynamic> json) {
    return SearchedHotelsEntityModel(
      checkedIn: json['checked_in'] as String?,
      checkedOut: json['checked_out'] as String?,
      cityId: json['city_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'checked_in': checkedIn,
        'checked_out': checkedOut,
        'city_id': cityId,
      };
}
