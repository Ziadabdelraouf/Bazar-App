import '../../domain/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.name,
    required super.image,
    super.role,
  });

  static List<AuthorModel> fromGoogleBooksResponse(
    Map<String, dynamic> json,
  ) {
    final items = json['items'];

    if (items is! List) {
      return const [];
    }

    final uniqueAuthors = <String, AuthorModel>{};

    for (final item in items) {
      if (item is! Map) {
        continue;
      }

      final volumeInfo = item['volumeInfo'];

      if (volumeInfo is! Map) {
        continue;
      }

      final authors = volumeInfo['authors'];

      if (authors is! List) {
        continue;
      }

      for (final authorValue in authors) {
        final name = authorValue.toString().trim();

        if (name.isEmpty) {
          continue;
        }

        uniqueAuthors.putIfAbsent(
          name,
          () => AuthorModel(
            name: name,
            image: '',
          ),
        );
      }
    }

    return uniqueAuthors.values.toList(growable: false);
  }
}