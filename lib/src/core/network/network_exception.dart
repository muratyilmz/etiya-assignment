// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class NetworkExceptions extends Equatable implements Exception {
  late String message;

  NetworkExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

        break;
      case DioErrorType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          message = 'No Internet';
          break;
        }
        message = 'Unexpected error occurred';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'].toString();
      case 401:
        return error['message'].toString();
      case 403:
        return error['message'].toString();
      case 404:
        return error['message'].toString();
      case 500:
        return error['message'].toString();
      case 502:
        return error['message'].toString();
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  List<Object> get props => [message];
}
