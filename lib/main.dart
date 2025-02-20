import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/routes.dart';
import 'package:photo_gallery/service_locator.dart';

void main() {
  runZoned(() async {
    await ServiceLocator.init();

    runApp(const PhotoGalleryApp());
  });
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photo Gallery',
      getPages: Routes.pages,
      initialRoute: RouteConstant.main,
    );
  }
}
