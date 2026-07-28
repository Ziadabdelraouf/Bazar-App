import '../entities/author.dart';

abstract interface class AuthorsRepository {
  Future<List<Author>> getAuthors();
}