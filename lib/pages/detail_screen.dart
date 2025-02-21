import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:photo_gallery/controller/controller.dart';
import 'package:photo_gallery/utils/blur_hash.dart';
import 'package:photo_gallery/widgets/widgets.dart';

class DetailScreen extends GetView<DetailScreenController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: Get.mediaQuery.size.height * 0.7,
              stretch: true,
              title: const Text('Photo Gallery'),
              backgroundColor: Get.theme.secondaryHeaderColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: controller.photo.value!.id,
                  child: OctoImage(
                    image: ExtendedNetworkImageProvider(
                      controller.photo.value!.urls.full,
                      cache: true,
                    ),
                    placeholderBuilder: blurHashPlaceholderBuilder(
                      controller.photo.value!.blurHash,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ImageDetailInfo(controller.photo.value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
