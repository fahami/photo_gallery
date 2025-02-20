import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_gallery/controller/controller.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/widgets/widgets.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Gallery')),
      body: PagedGridView(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Photo>(
          itemBuilder: (context, photo, index) {
            return ImageCard(photo, onTap: () => controller.onPhotoTap(photo));
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
