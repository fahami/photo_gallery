import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({required this.city, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final String city;
  final String country;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
