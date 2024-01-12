import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/utils/loading/loading_screen.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    LoadingUtils.hideLoader();
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: 'no internet');
        case DioExceptionType.connectionTimeout:
          return APIException(message: 'connectionTimeout');
        case DioExceptionType.badResponse:
          print(error.error);
          return APIException(
              message: error.response?.data['Message'] ?? 'Bad Response');
        case DioExceptionType.unknown:
          return APIException(message: "SSSS..");
        default:
          return APIException(message: 'something went wrong');
      }
    } else {
      return APIException(message: 'Something went wrong');
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    Get.rawSnackbar(message: error?.message ?? 'Something went wrong');
  }
}
