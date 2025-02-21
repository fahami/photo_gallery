import 'package:get/get.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/repositories/repositories.dart';
import 'package:photo_gallery/utils/enums.dart';

class DetailScreenController extends GetxController {
  DetailScreenController({required this.repository});

  final PhotoRepository repository;
  final photo = Rxn<Photo>();
  final photoState = Rx<RequestState>(RequestState.initial);

  @override
  void onInit() {
    checkPhotoIdArgument();
    super.onInit();
  }

  /// Check if the photo argument is passed,
  /// if not show a snackbar and navigate back
  void checkPhotoIdArgument() {
    if (Get.arguments['photo'] == null) {
      Get
        ..snackbar('Error', 'Photo is missing')
        ..back();
    }

    // Assign the photo value from the arguments to the photo variable
    photo.value = Get.arguments['photo'] as Photo;
    fetchPhoto(photo.value!.id);
  }

  /// Fetch photo by id
  Future<void> fetchPhoto(String id) async {
    try {
      photoState.value = RequestState.loading;
      final photo = await repository.fetchPhoto(id);
      this.photo.value = photo;
      photoState.value = RequestState.loaded;
    } catch (error) {
      photoState.value = RequestState.error;
    }
  }
}
