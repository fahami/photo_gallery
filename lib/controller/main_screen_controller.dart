import 'dart:developer';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/repositories/repositories.dart';
import 'package:photo_gallery/utils/constants.dart';

class MainScreenController extends GetxController {
  MainScreenController({required this.repository});

  final PhotoRepository repository;

  final pagingController = PagingController<int, Photo>(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener(fetchPhotos);
    super.onInit();
  }

  void onPhotoTap(Photo photo) {}

  Future<void> fetchPhotos(int pageKey) async {
    try {
      final photos = await repository.fetchPhotos(page: pageKey);
      final isLastPage = photos.length < defaultPageSize;
      if (isLastPage) {
        pagingController.appendLastPage(photos);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(photos, nextPageKey);
      }
    } catch (error, stackTrace) {
      log('Failed to fetch photos', error: error, stackTrace: stackTrace);
      pagingController.error = error;
    }
  }
}
