import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/home/data/models/author_model.dart';

abstract interface class AuthorsRemoteDataSource {
  Future <List<AuthorModel>> getAuthors();
}
 class AuthorsRemoteDataSourceImpl implements AuthorsRemoteDataSource{
  const AuthorsRemoteDataSourceImpl(this.dio);
  final BooksDio dio;
  @override
  Future <List<AuthorModel>> getAuthors()async
  {
    final response=await dio.dio.get(ApiConstants.volumesEndpoint,
    queryParameters: {
        'q': 'subject:fiction',
        'maxResults': 10,
      },);
      print(response.data);

    return [];
  }

 }