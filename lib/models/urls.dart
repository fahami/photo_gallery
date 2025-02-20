
import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable()
class Urls {
  const Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
