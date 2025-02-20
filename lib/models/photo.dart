import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/exif.dart';
import 'package:photo_gallery/models/location.dart';
import 'package:photo_gallery/models/urls.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  const Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.urls,
    this.description,
    this.location,
    this.exif,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String? description;
  final Location? location;
  final Exif? exif;
  final Urls urls;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
