import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/models/user.dart';

class ImageAuthor extends StatelessWidget {
  const ImageAuthor(
    this.user, {
    this.isDark = false,
    this.showUsername = false,
    super.key,
  });

  final User user;
  final bool isDark;
  final bool showUsername;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: ExtendedNetworkImageProvider(
            user.profileImage.medium,
            cache: true,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  user.name,
                  style: TextStyle(
                    color: isDark ? Colors.white : null,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showUsername)
                Flexible(
                  child: Text(
                    '@${user.username}',
                    style: TextStyle(
                      color: isDark ? Colors.white : null,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
