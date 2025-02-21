import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controller/controller.dart';
import 'package:photo_gallery/pages/pages.dart';

class RouteConstant {
  RouteConstant._();

  static const String main = '/';
  static const String photoDetail = '/photo_detail';
}

class Routes {
  Routes._();

  static final pages = <GetPage<Widget>>[
    GetPage(
      name: RouteConstant.main,
      page: MainScreen.new,
      binding: BindingsBuilder.put(
        () => MainScreenController(repository: Get.find()),
      ),
    ),
    GetPage(
      name: RouteConstant.photoDetail,
      page: DetailScreen.new,
      binding: BindingsBuilder.put(
        () => DetailScreenController(repository: Get.find()),
      ),
    ),
  ];
}
