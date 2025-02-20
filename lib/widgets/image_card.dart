import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/models/models.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(this.photo, {super.key, this.onTap});

  final Photo photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        fit: StackFit.expand,
        children: [
          ExtendedImage.network(photo.urls.small, fit: BoxFit.cover),
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: ExtendedNetworkImageProvider(
                      photo.user.profileImage.medium,
                      cache: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      photo.user.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
