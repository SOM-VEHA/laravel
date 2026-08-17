// import 'package:dio/dio.dart';
// import 'package:movie_mobile/app/core/constanst/api_constants.dart';
// class DioClient {
//   final Dio dio;
//   DioClient() : dio = Dio(
//     BaseOptions(
//       baseUrl: ApiConstants.baseUrl,
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//     ),
//   );
// }

import 'package:dio/dio.dart';
import 'package:movie_mobile/app/core/constanst/api_constants.dart';
import 'api_exception.dart';

class DioClient {
  final Dio dio;
  DioClient() : dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          final exception = _handleError(error);

          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: exception,
              response: error.response,
              type: error.type,
            ),
          );
        },
      ),
    );
  }
  ApiException _handleError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case 400:
          return ApiException(
            message: 'Bad request',
            statusCode: statusCode,
          );
        case 401:
          return ApiException(
            message: 'Unauthorized',
            statusCode: statusCode,
          );
        case 403:
          return ApiException(
            message: 'Forbidden',
            statusCode: statusCode,
          );
        case 404:
          return ApiException(
            message: 'Data not found',
            statusCode: statusCode,
          );
        case 422:
          return ApiException(
            message: 'Validation error',
            statusCode: statusCode,
          );
        case 500:
          return ApiException(
            message: 'Server error',
            statusCode: statusCode,
          );
        default:
          return ApiException(
            message: 'Something went wrong',
            statusCode: statusCode,
          );
      }
    }
    return ApiException(
      message: 'Network error. Please check your connection.',
    );
  }
}