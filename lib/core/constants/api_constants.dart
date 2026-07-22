class ApiConstants {
  ApiConstants._();

  static const String booksBaseUrl =
      'https://www.googleapis.com/books/v1';

  static const String googleBooksApiKey =
      String.fromEnvironment('GOOGLE_BOOKS_API_KEY');

  static const String volumesEndpoint = '/volumes';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
}
