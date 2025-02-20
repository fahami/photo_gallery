import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/profile_image.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.id, required this.name, required this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String id;
  final String name;
  final ProfileImage profileImage;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
