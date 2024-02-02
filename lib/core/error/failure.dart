import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Send timeout with the api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connetion Error');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was error , please try again later!');
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          'You request is not found , please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There was error with the server, please try again later!');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']);
    } else {
      return ServerFailure('Opps There was error , please try again later!');
    }
  }
}
