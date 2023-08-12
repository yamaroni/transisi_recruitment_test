import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void initialDio(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 40),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  static void setDioLogger(String baseUrl) {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          log('${response.statusCode} - ${response.data.toString()}\n');
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          log('${request.method} - ${request.path} - ${request.data}');
          return requestInterceptorHandler.next(request);
        },
        onError: (DioException error, errorInterceptor) {
          log(error.message.toString());
          return errorInterceptor.next(error);
        },
      ),
    );
  }
}