import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../common/config/api_urls.dart';

class DioNetworkService {
  final Dio _dio;
  Dio get dio => _dio;

  ///BASE OPTIONS
 final BaseOptions _baseOptions = BaseOptions(
    baseUrl: APIUrls.baseUrl,
   connectTimeout: const Duration(seconds: 15),
   receiveTimeout: const Duration(seconds: 15),
  );


  ///INTERCEPTORS
  final List<Interceptor> _interceptors = [
    if(kDebugMode) PrettyDioLogger(requestBody: true, requestHeader: true, responseBody: true, responseHeader: true, error: true),
  ];

  InterceptorsWrapper get _interceptorWrapper => InterceptorsWrapper(
      onRequest: (options, handler) async {
        // options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onError: (e, handler) async {
        return handler.next(e);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
    );

  ///CONSTRUCTORS
  DioNetworkService._(this._dio,);
  factory DioNetworkService() {
    final obj = DioNetworkService._(Dio(),);
    obj._dio.options = obj._baseOptions;
    obj._dio.interceptors.addAll(
      [
        ...obj._interceptors,
        obj._interceptorWrapper,

      ],
    );
    return obj;
  }



}
