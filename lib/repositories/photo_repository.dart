import 'package:dio/dio.dart';
import 'package:photo_gallery/models/models.dart';
import 'package:photo_gallery/utils/constants.dart';

abstract class PhotoRepository {
  Future<List<Photo>> fetchPhotos({required int page});

  Future<Photo> fetchPhoto(String id);

  Future<List<Photo>> searchPhotos({required String query});
}

class PhotoRepositoryImpl implements PhotoRepository {
  PhotoRepositoryImpl({required this.client});

  final Dio client;

  @override
  Future<Photo> fetchPhoto(String id) async {
    final result = await client.get('/photos/$id');
    final json = result.data as Map<String, dynamic>;
    final photo = Photo.fromJson(json);

    return photo;
  }

  @override
  Future<List<Photo>> fetchPhotos({required int page}) async {
    final result = await client.get(
      '/photos',
      queryParameters: {'page': page, 'per_page': defaultPageSize},
    );
    final json = result.data as List;
    final photos = List<Map<String, dynamic>>.from(json).map(Photo.fromJson);

    return photos.toList();
  }

  @override
  Future<List<Photo>> searchPhotos({required String query}) async {
    final result = await client.get(
      '/search/photos',
      queryParameters: {'query': query, 'per_page': defaultPageSize},
    );
    final json = result.data['results'] as List;
    final photos = List<Map<String, dynamic>>.from(json).map(Photo.fromJson);

    return photos.toList();
  }
}
