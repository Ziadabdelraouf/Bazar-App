import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class BooksDio {
  late final Dio dio;
  BooksDio()
  {
    dio=Dio(
      BaseOptions(baseUrl: ApiConstants.booksBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),)
    );
  }
}