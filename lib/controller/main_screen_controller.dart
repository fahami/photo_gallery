import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/repositories/repositories.dart';
import 'package:photo_gallery/utils/constants.dart';

class MainScreenController extends GetxController {
  MainScreenController({required this.repository});

  final PhotoRepository repository;

  final pagingController = PagingController<int, Photo>(firstPageKey: 1);
  final searchControler = SearchController();
  final query = ''.obs;
  final historySearch = <String>[].obs;
  final debouncer = Debouncer(delay: const Duration(milliseconds: 700));

  @override
  void onInit() {
    pagingController.addPageRequestListener(fetchPhotos);
    listenSearchQuery();
    super.onInit();
  }

  void onPhotoTap(Photo photo) {
    Get.toNamed('/photo_detail', arguments: {'photo': photo});
  }

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

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void listenSearchQuery() {
    searchControler.addListener(() {
      debouncer.call(() {
        if (searchControler.text.isNotEmpty) {
          query.value = searchControler.text;

          searchPhotos(searchControler.text);
        } else {
          query.value = '';
          pagingController.refresh();
        }
      });
    });
  }

  Future<void> searchPhotos(String query) async {
    try {
      final photos = await repository.searchPhotos(query: query);
      pagingController.itemList = photos;

      // Add the query to the history search
      historySearch.addIf(
        !historySearch.contains(searchControler.text),
        searchControler.text,
      );
    } catch (error, stackTrace) {
      log('Failed to search photos', error: error, stackTrace: stackTrace);
      pagingController.error = error;
    }
  }
}
