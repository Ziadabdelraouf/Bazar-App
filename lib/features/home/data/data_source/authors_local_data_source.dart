import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/author_model.dart';

abstract interface class AuthorsLocalDataSource {
  Future<List<AuthorModel>> getAuthors();
}

class AuthorsLocalDataSourceImpl
    implements AuthorsLocalDataSource {
  const AuthorsLocalDataSourceImpl();

  @override
  Future<List<AuthorModel>> getAuthors() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/books_data.json',
    );

    final decodedData = jsonDecode(jsonString);

    if (decodedData is! Map) {
      throw const FormatException(
        'Invalid mock authors data',
      );
    }

    final json = Map<String, dynamic>.from(decodedData);

    return AuthorModel.fromGoogleBooksResponse(json);
  }
}