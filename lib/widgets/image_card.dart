import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/utils/blur_hash.dart';
import 'package:photo_gallery/widgets/image_author.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(this.photo, {super.key, this.onTap});

  final Photo photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: photo.id,
            child: OctoImage(
              image: ExtendedNetworkImageProvider(photo.urls.small),
              placeholderBuilder: blurHashPlaceholderBuilder(photo.blurHash),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: ImageAuthor(photo.user, isDark: true),
            ),
          ),
        ],
      ),
    );
  }
}
