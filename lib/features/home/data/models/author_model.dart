import '../../domain/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.name,
    required super.image,
    required super.role,
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

      final title = volumeInfo['title']?.toString().trim() ?? '';

      final imageLinks = volumeInfo['imageLinks'];

      String image = '';

      if (imageLinks is Map) {
        image =
            imageLinks['thumbnail']?.toString() ??
            imageLinks['smallThumbnail']?.toString() ??
            '';

        image = image.replaceFirst(
          'http://',
          'https://',
        );
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
            role: title.isEmpty
                ? 'Author'
                : 'Author of $title',
            image: image,
          ),
        );
      }
    }

    return uniqueAuthors.values.toList(
      growable: false,
    );
  }
}