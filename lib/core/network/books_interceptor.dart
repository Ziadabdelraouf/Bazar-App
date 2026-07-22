import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class BooksInterceptor extends Interceptor {
 @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  )
  {
    options.queryParameters['key']=ApiConstants.googleBooksApiKey;
    handler.next(options);
  }
}