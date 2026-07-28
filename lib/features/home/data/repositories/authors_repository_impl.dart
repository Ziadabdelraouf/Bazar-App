import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../domain/entities/author.dart';
import '../../domain/repositories/authors_repository.dart';
import '../data_source/authors_local_data_source.dart';
import '../data_source/authors_remote_data_source.dart';

class AuthorsRepositoryImpl implements AuthorsRepository {
  const AuthorsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final AuthorsRemoteDataSource remoteDataSource;
  final AuthorsLocalDataSource localDataSource;

  @override
  Future<List<Author>> getAuthors() async {
    try {
      final authors = await remoteDataSource.getAuthors();

      if (authors.isNotEmpty) {
        debugPrint('AUTHORS SOURCE: API');
        return authors;
      }

      debugPrint('AUTHORS SOURCE: LOCAL - API returned empty');
      return localDataSource.getAuthors();
    } on DioException catch(error){
      debugPrint('STATUS CODE: ${error.response?.statusCode}');
      debugPrint('RESPONSE BODY: ${error.response?.data}');
      debugPrint('REQUEST PATH: ${error.requestOptions.path}');
      
      return localDataSource.getAuthors();
      
    } on FormatException catch(error) {
      debugPrint(
      'AUTHORS SOURCE: LOCAL - parsing error: $error',
    );
      return localDataSource.getAuthors();
    }
  }
}