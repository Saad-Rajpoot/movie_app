import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_constant.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: AppConstants.connectTimeoutDuration)
      ..options.receiveTimeout = const Duration(seconds: AppConstants.receiveTimeoutDuration)
      ..options.headers = {
        'Authorization': 'Bearer ${ApiConstants.authorizationToken}',
        'Content-Type': ApiConstants.headerParam,
        'Accept': ApiConstants.headerParam,
      };
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }
}
