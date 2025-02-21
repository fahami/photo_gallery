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
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          SearchAnchor(
            searchController: controller.searchControler,
            viewConstraints: const BoxConstraints.tightFor(
              width: 300,
              height: 300,
            ),
            suggestionsBuilder: (context, ctrl) {
              return controller.historySearch.reversed.map((suggestion) {
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(suggestion),
                  onTap: () => ctrl.closeView(suggestion),
                );
              }).toList();
            },
            builder: (context, anchorKey) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => controller.searchControler.openView(),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () =>
                controller.query.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Search results for "${controller.query}"',
                        style: Get.theme.textTheme.titleSmall,
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
          Expanded(
            child: PagedGridView(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Photo>(
                itemBuilder: (context, photo, index) {
                  return ImageCard(
                    photo,
                    onTap: () => controller.onPhotoTap(photo),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
