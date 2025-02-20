import 'package:json_annotation/json_annotation.dart';

part 'exif.g.dart';

@JsonSerializable()
class Exif {
  Exif({
    required this.make,
    required this.model,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json) => _$ExifFromJson(json);

  final String make;
  final String model;
  final String exposureTime;
  final String aperture;
  final String focalLength;
  final int iso;

  Map<String, dynamic> toJson() => _$ExifToJson(this);
}
