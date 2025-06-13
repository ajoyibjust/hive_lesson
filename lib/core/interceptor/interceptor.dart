import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  Dio dioClient =
      Dio(
          BaseOptions(
            baseUrl: "https://api.elaro.uz/api/",  
            receiveTimeout: Duration(minutes: 1),
            connectTimeout: Duration(minutes: 1),
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (option, handler) {
              log("METHOD TYPE: ${option.method}");
              log("METHOD PATH: ${option.path}");
              log("REQUEST BODY: ${option.data}");
              return handler.next(option);
            },
            onResponse: (option, handler) {
              log("RESPONSE STATUS CODE: ${option.statusCode}");
              log("RESPONSE DATA: ${option.data}");
              return handler.next(option);
            },
            onError: (error, handler) {
              log("ON ERROR: $error");
              return handler.next(error);
            },
          ),
        );
}
