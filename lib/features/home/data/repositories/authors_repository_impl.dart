import 'package:bazar_group_1/features/home/data/data_source/authors_remote_data_source.dart';

import '../../domain/entities/author.dart';
import '../../domain/repositories/authors_repository.dart';


class AuthorsRepositoryImpl implements AuthorsRepository {
  const AuthorsRepositoryImpl(this.remoteDataSource);

  final AuthorsRemoteDataSource remoteDataSource;

  @override
  Future<List<Author>> getAuthors() {
    return remoteDataSource.getAuthors();
  }
}