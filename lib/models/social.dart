import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@JsonSerializable()
class Social {
  Social({this.instagramUsername, this.portfolioUrl, this.twitterUsername});

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  final String? instagramUsername;
  final String? portfolioUrl;
  final String? twitterUsername;

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
