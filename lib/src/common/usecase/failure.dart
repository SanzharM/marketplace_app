import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.key = 'Server Error', this.message, this.status});

  final String key;
  final String? message;
  final int? status;

  @override
  List<Object?> get props => [key, message, status];
}

class ServerFailure extends Failure {
  const ServerFailure({String? message}) : super(message: message);

  factory ServerFailure.fromDioError(DioError error, {String? message}) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      // return ServerFailure(message: L10n.current.connectTimeout);
      case DioErrorType.sendTimeout:
      // return ServerFailure(message: L10n.current.connectTimeout);
      case DioErrorType.receiveTimeout:
      // return ServerFailure(message: L10n.current.receiveTimeout);
      case DioErrorType.response:
      case DioErrorType.cancel:
      case DioErrorType.other:
        return ServerFailure(
          message: message ?? error.message,
        );
    }
  }

  @override
  String toString() {
    return message ?? super.toString();
  }
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message});
}
