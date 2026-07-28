import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/home/data/models/author_model.dart';

abstract interface class AuthorsRemoteDataSource {
  Future<List<AuthorModel>> getAuthors();
}

class AuthorsRemoteDataSourceImpl
    implements AuthorsRemoteDataSource {
  const AuthorsRemoteDataSourceImpl(this.booksDio);

  final BooksDio booksDio;

  @override
  Future<List<AuthorModel>> getAuthors() async {
    final response = await booksDio.dio.get(
      ApiConstants.volumesEndpoint,
      queryParameters: {
        'q': 'subject:fiction',
        'maxResults': 10,
      },
    );

    final responseData = response.data;

    if (responseData is! Map) {
      throw const FormatException(
        'Invalid Google Books response',
      );
    }

    final json = Map<String, dynamic>.from(responseData);

    return AuthorModel.fromGoogleBooksResponse(json);
  }
}