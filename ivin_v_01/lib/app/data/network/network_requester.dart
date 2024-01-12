import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ivin_v_01/app/data/values/urls.dart';
import 'package:ivin_v_01/utils/helper/exception_handler.dart';

class NetworkRequester {
  late Dio _dio;
  late Dio _formDio;

  NetworkRequester() {
    prepareRequest();
    prepareFormRequest();
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      baseUrl: URLs.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );
    _dio = Dio(dioOptions);
    _dio.interceptors.clear();
    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  void prepareFormRequest() {
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        baseUrl: URLs.baseURL,
        contentType: "multipart/form-data",
        responseType: ResponseType.json);

    _formDio = Dio(dioOptions);

    _formDio.interceptors.clear();

    _formDio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    String? token, // Add a token parameter
  }) async {
    try {
      final options = Options(
        headers: {
          'Authorization':
              'Bearer $token', // Add the Bearer token to the headers
        },
      );

      final response =
          await _dio.get(path, queryParameters: query, options: options);
      return response.data;
    } on DioException catch (dioError) {
      return ExceptionHandler.handleError(dioError);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final options = Options(headers: {});
      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post(path,
          queryParameters: query, data: data, options: options);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final options = Options(
        headers: {
          'Authorization':
              'Bearer $token', // Add the Bearer token to the headers
        },
      );

      final response = await _dio.put(path,
          queryParameters: query, data: data, options: options);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }
}
