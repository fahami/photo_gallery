// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
  description: json['description'] as String?,
  location:
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
  exif:
      json['exif'] == null
          ? null
          : Exif.fromJson(json['exif'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'width': instance.width,
  'height': instance.height,
  'description': instance.description,
  'location': instance.location?.toJson(),
  'exif': instance.exif?.toJson(),
  'urls': instance.urls.toJson(),
};
