import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dynamic data = options.data;
    if (data is FormData) {
      data = [...data.fields, ...data.files];
    }
    debugPrint(
      '\n------------\n'
      'LOG TIME: ${DateTime.now()}\n'
      'HEADERS: ${options.headers}\n'
      'REQUESTING URI: ${options.uri}\n'
      'REQUESTING DATA: $data\n'
      '------------\n',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dynamic requestData = response.requestOptions.data;
    if (requestData is FormData) {
      requestData = [...requestData.fields, ...requestData.files];
    }
    log(
      '\n------------\n'
      'LOG TIME: ${DateTime.now()}\n'
      'STATUS CODE: ${response.statusCode}\n'
      'RESPONSE URI: ${response.realUri}\n'
      'HEADERS: ${response.requestOptions.headers}\n'
      'REQUEST DATA: $requestData\n'
      'RESPONSE BODY: ${response.data}\n'
      'MESSAGE: ${response.statusMessage}\n'
      '------------\n',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      '\n------------\n'
      'LOG TIME: ${DateTime.now()}\n'
      'STATUS CODE: ${err.response?.statusCode}\n'
      'RESPONSE URI: ${err.response?.realUri}\n'
      'ERROR: ${err.type} ${err.error}\n'
      'RESPONSE BODY: ${err.response?.data}\n'
      'MESSAGE: ${err.response?.statusMessage}\n'
      '------------\n',
    );
    super.onError(err, handler);
  }
}
