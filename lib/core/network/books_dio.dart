import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/api_constants.dart';
import 'books_interceptor.dart';

class BooksDio {
  static final BooksDio _instance = BooksDio._internal();
  factory BooksDio() => _instance;

  static Dio get client => _instance.dio;

  late final Dio dio;

  BooksDio._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.booksBaseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
      ),
    );
    dio.interceptors.addAll([
      BooksInterceptor(dio: dio),
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }
}

///global Dio client instance
final booksDio = BooksDio().dio;

///global riverpod provider (if needed)
final booksDioProvider = Provider<Dio>((ref) => booksDio);
