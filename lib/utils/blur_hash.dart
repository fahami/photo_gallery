import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

/// Simple set to show [OctoPlaceholder.circularProgressIndicator] as
/// placeholder and [OctoError.icon] as error.
OctoSet blurHash(String hash, {BoxFit? fit, Text? errorMessage}) {
  return OctoSet(
    placeholderBuilder: blurHashPlaceholderBuilder(hash, fit: fit),
    errorBuilder: blurHashErrorBuilder(hash, fit: fit),
  );
}

OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash, {BoxFit? fit}) {
  return (context) => SizedBox.expand(
    child: Image(image: BlurHashImage(hash), fit: fit ?? BoxFit.cover),
  );
}

OctoErrorBuilder blurHashErrorBuilder(
  String hash, {
  BoxFit? fit,
  Text? message,
  IconData? icon,
  Color? iconColor,
  double? iconSize,
}) {
  return OctoError.placeholderWithErrorIcon(
    blurHashPlaceholderBuilder(hash, fit: fit),
    message: message,
    icon: icon,
    iconColor: iconColor,
    iconSize: iconSize,
  );
}
