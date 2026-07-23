import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class BooksInterceptor extends Interceptor {
  final Dio? dio;
  final int maxRetries;
  final Duration retryDelay;

  BooksInterceptor({
    this.dio,
    this.maxRetries = 5,
    this.retryDelay = const Duration(seconds: 3),
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['key'] = ApiConstants.googleBooksApiKey;
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final isRetryable =
        (statusCode != null && statusCode >= 500) ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;

    if (isRetryable) {
      final retryCount = (err.requestOptions.extra['retry_count'] as int? ?? 0);
      if (retryCount < maxRetries) {
        err.requestOptions.extra['retry_count'] = retryCount + 1;
        if (retryDelay > Duration.zero) {
          await Future.delayed(retryDelay);
        }
        try {
          final client = dio ?? Dio();
          final response = await client.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          final dioErr = e is DioException
              ? e
              : DioException(requestOptions: err.requestOptions, error: e);
          return handler.reject(dioErr);
        }
      }
    }
    return handler.next(err);
  }
}
