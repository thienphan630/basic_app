import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:basic_app/core/data/datasources/local_storage.dart';

import 'network_constan.dart';

class DioMiddleware {
  final LocalStorage localStorage;

  DioMiddleware({required this.localStorage});

  void onUnauthorized() {}

  Dio createDio() {
    final dio = Dio()
      ..options.baseUrl = API_BASE_URL
      ..options.connectTimeout = const Duration(microseconds: 60000)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final accessToken = localStorage.getAccessToken();
            if (accessToken != null) {
              options.headers["Authorization"] = "Bearer $accessToken";
            }
            return handler.next(options);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
          onError: (error, handler) async {
            if (error.type == DioExceptionType.badResponse &&
                error.response != null &&
                error.response!.data is Map<String, dynamic>) {
              final data = error.response!.data as Map<String, dynamic>;
              switch (error.response!.statusCode) {
                case 400:
                  if (data.containsKey('message')) {
                    error = CustomDioError(
                        requestOptions: error.requestOptions,
                        error: data['message']);
                  }
                  break;
                case 403:
                  error = CustomDioError(
                      requestOptions: error.requestOptions,
                      error:
                          'Phiên làm việc hết hiệu lực, vui lòng đăng nhập lại.');
                  onUnauthorized();
                  break;
                default:
                  error = CustomDioError(
                      requestOptions: error.requestOptions,
                      error: 'Lỗi dữ liệu, vui lòng thử lại!');
                  break;
              }
            } else if (error.type == DioExceptionType.unknown) {
              error = CustomDioError(
                  requestOptions: error.requestOptions,
                  error: 'Lỗi dữ liệu, vui lòng thử lại!');
            } else {
              error = CustomDioError(
                  requestOptions: error.requestOptions,
                  error: 'Vui lòng kiểm tra kết nối Internet và tải lại!');
            }
            return handler.next(error);
          },
        ),
      );

    if (Platform.isAndroid) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient;
    }
    return dio;
  }
}

class CustomDioError extends DioException {
  @override
  RequestOptions get requestOptions;

  CustomDioError({required requestOptions, dynamic error})
      : super(error: error, requestOptions: requestOptions);
  @override
  String toString() {
    return error.toString();
  }
}
