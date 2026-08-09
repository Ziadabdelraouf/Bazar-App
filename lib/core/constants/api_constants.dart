import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static const String booksBaseUrl = 'https://www.googleapis.com/books/v1';

  static String get googleBooksApiKey =>
      dotenv.env['GOOGLE_BOOKS_API_KEY'] ?? '';

  static String get recaptchaSiteKey => dotenv.env['RECAPTCHA_SITE_KEY'] ?? '';
  static String get debugToken => dotenv.env['APP_CHECK_DEBUG_TOKEN'] ?? '';

  static const String volumesEndpoint = '/volumes';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
}
