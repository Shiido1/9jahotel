import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  @JsonKey(name: 'hotels_booked')
  int? hotelsBooked;
  @JsonKey(name: 'days_booked')
  dynamic daysBooked;
  dynamic cities;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.hotelsBooked,
    this.daysBooked,
    this.cities,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
