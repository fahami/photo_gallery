// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  name: json['name'] as String,
  profileImage: ProfileImage.fromJson(
    json['profile_image'] as Map<String, dynamic>,
  ),
  username: json['username'] as String,
  social: Social.fromJson(json['social'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'profile_image': instance.profileImage.toJson(),
  'social': instance.social.toJson(),
  'bio': instance.bio,
};
