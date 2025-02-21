import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:photo_gallery/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'Profile',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OctoImage(
                imageBuilder: (context, child) {
                  return ClipOval(child: child);
                },
                image: ExtendedNetworkImageProvider(
                  user.profileImage.large,
                  cache: true,
                ),
              ),
              const SizedBox(height: 16),
              Text(user.name, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 4),
              InkWell(
                onTap: () => launchUrl(
                  Uri.parse('https://unsplash.com/@${user.username}'),
                ),
                child: Text(
                  '@${user.username}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.bio ?? '',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (user.social.instagramUsername?.isNotEmpty ?? false)
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      onPressed:
                          () => launchUrl(
                            Uri.parse(
                              'https://instagram.com/${user.social.instagramUsername}',
                            ),
                          ),
                    ),
                  if (user.social.twitterUsername?.isNotEmpty ?? false)
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      onPressed:
                          () => launchUrl(
                            Uri.parse(
                              'https://twitter.com/${user.social.twitterUsername}',
                            ),
                          ),
                    ),
                  if (user.social.portfolioUrl?.isNotEmpty ?? false)
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.globe),
                      onPressed:
                          () => launchUrl(Uri.parse(user.social.portfolioUrl!)),
                    ),
                ],
              ),
            ],
          ),
        );
      },
      child: Row(
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
      ),
    );
  }
}
