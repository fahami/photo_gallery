import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/repositories/repositories.dart';
import 'package:photo_gallery/utils/http_provider.dart';

/// Service locator for dependency injection
class ServiceLocator {
  /// Initialize the service locator
  static Future<void> init() async {
    final httpProvider = HttpProvider()..initialize();
    Get
      ..put<Dio>(httpProvider.client)
      ..lazyPut<PhotoRepository>(
        () => PhotoRepositoryImpl(client: Get.find()),
        fenix: true,
      );
  }
}
