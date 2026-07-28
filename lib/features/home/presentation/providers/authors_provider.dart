import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/books_dio.dart';
import '../../data/data_source/authors_local_data_source.dart';
import '../../data/data_source/authors_remote_data_source.dart';
import '../../data/repositories/authors_repository_impl.dart';
import '../../domain/entities/author.dart';
import '../../domain/repositories/authors_repository.dart';

final booksDioProvider = Provider<BooksDio>((ref) {
  final booksDio = BooksDio();

  ref.onDispose(() {
    booksDio.dio.close(force: true);
  });

  return booksDio;
});

final authorsRemoteDataSourceProvider =
    Provider<AuthorsRemoteDataSource>((ref) {
  return AuthorsRemoteDataSourceImpl(
    ref.read(booksDioProvider),
  );
});

final authorsLocalDataSourceProvider =
    Provider<AuthorsLocalDataSource>((ref) {
  return const AuthorsLocalDataSourceImpl();
});

final authorsRepositoryProvider =
    Provider<AuthorsRepository>((ref) {
  return AuthorsRepositoryImpl(
    remoteDataSource:
        ref.read(authorsRemoteDataSourceProvider),
    localDataSource:
        ref.read(authorsLocalDataSourceProvider),
  );
});

final authorsProvider =
    FutureProvider<List<Author>>((ref) async {
  final repository = ref.read(authorsRepositoryProvider);

  return repository.getAuthors();
});