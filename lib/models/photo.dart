import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/exif.dart';
import 'package:photo_gallery/models/location.dart';
import 'package:photo_gallery/models/urls.dart';
import 'package:photo_gallery/models/user.dart';

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
    required this.user,
    required this.likes,
    required this.blurHash,
    this.description,
    this.location,
    this.exif,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  final String id;
  final String blurHash;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String? description;
  final Location? location;
  final Exif? exif;
  final Urls urls;
  final User user;
  final int likes;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
