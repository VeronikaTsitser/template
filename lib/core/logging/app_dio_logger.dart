import 'package:dio/dio.dart';

import '../model/base_model.dart';
import 'app_logger.dart';

final class AppDioLogger extends Interceptor {
  const AppDioLogger();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logError(
      {
        'PATH': err.requestOptions.uri,
        'RESPONSE ERROR:': err.response,
        'STATUS CODE': err.response?.statusCode,
        'MESSAGE': err.message,
        'DATA': err.response?.data,
      },
      err,
      err.stackTrace,
    );
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logInfo({
      'RESPONSE': response.requestOptions.uri,
      'STATUS CODE': response.statusCode,
      'DATA': response.data,
    });
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final path = options.uri.toString();
    final headers = options.headers;
    final data = options.data is BaseToJsonModel ? (options.data as BaseToJsonModel).toJson() : options.data;

    logInfo({
      'METHOD': method,
      'PATH': path,
      'HEADERS': headers,
      'QUERY PARAMETERS': options.queryParameters,
      'DATA': data,
    });
    super.onRequest(options, handler);
  }
}
