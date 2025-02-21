import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_gallery/controller/controller.dart';
import 'package:photo_gallery/models/exif.dart';
import 'package:photo_gallery/models/photo.dart';
import 'package:photo_gallery/utils/enums.dart';
import 'package:photo_gallery/widgets/image_author.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageDetailInfo extends GetView<DetailScreenController> {
  const ImageDetailInfo(this.photo, {super.key});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageAuthor(photo.user, showUsername: true),
            const Spacer(),
            const Icon(Icons.favorite, color: Colors.red),
            const SizedBox(width: 4),
            Text(photo.likes.toString()),
          ],
        ),
        const SizedBox(height: 16),
        if (photo.description?.isNotEmpty ?? false) ...[
          Text(
            photo.description ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 16),
        ],
        Row(
          children: [
            const Icon(Icons.date_range, size: 14),
            const SizedBox(width: 8),
            Text(
              DateFormat.yMMMMd().format(photo.createdAt),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        Obx(
          () => Skeletonizer(
            enabled: controller.photoState.value == RequestState.loading,
            child: Column(
              children: [
                if (photo.location?.city?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        photo.location?.city ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                Obx(() {
                  if (controller.photoState.value == RequestState.error) {
                    return ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.error, color: Colors.red),
                      title: const Text('Failed to load photo details'),
                      subtitle: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () => controller.fetchPhoto(photo.id),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (photo.exif != null) {
                    return viewCameraDetail(photo.exif!);
                  }

                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget viewCameraDetail(Exif exif) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.grey),
      ),
      leading: const Icon(Icons.camera_alt, size: 24),
      titleAlignment: ListTileTitleAlignment.top,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cameraDetailLine('Camera:', '${exif.make}, ${exif.model}'),
          cameraDetailLine('Aperture:', exif.aperture),
          cameraDetailLine('Focal Length:', exif.focalLength),
          cameraDetailLine('Exposure Time:', exif.exposureTime),
          cameraDetailLine('ISO:', exif.iso.toString()),
        ],
      ),
    );
  }

  Widget cameraDetailLine(String title, String? value) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 4),
        Flexible(
          child: Text(value ?? '-', style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
