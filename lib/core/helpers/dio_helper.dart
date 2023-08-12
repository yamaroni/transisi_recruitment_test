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
          print('${response.statusCode} - ${response.data.toString()}\n');
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          print('${request.method} - ${request.path} - ${request.data}');
          return requestInterceptorHandler.next(request);
        },
        onError: (DioException error, errorInterceptor) {
          print(error.message);
          return errorInterceptor.next(error);
        },
      ),
    );
  }
}