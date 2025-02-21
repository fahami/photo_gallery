import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/models.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.username,
    required this.social,
    this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String id;
  final String name;
  final String username;
  final ProfileImage profileImage;
  final Social social;
  final String? bio;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
