import 'package:dio/dio.dart';
import 'package:photo_gallery/utils/constants.dart';

/// HTTP Client to make API calls
class HttpProvider {
  Dio? _client;

  /// Singleton instance
  Dio get client => _client ??= Dio(_option);

  /// Base URL for the API
  String get baseUrl => unsplashBaseUrl;

  BaseOptions get _option => BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json',
    headers: {'Authorization': 'Client-ID $unsplashApiKey'},
    connectTimeout: timeOutDuration,
    receiveTimeout: timeOutDuration,
    sendTimeout: timeOutDuration,
  );

  /// Initialize the client with the options
  void initialize() {
    _client = Dio(_option);
  }
}
