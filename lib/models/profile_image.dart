import 'package:json_annotation/json_annotation.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  final String small;
  final String medium;
  final String large;

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
