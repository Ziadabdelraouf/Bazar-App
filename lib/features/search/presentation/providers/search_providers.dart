import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/categories/presentation/providers/category_providers.dart';
import 'package:bazar_group_1/features/categories/domain/entities/book.dart';
import 'package:bazar_group_1/features/home/presentation/providers/authors_provider.dart';
import 'package:bazar_group_1/features/home/data/repositories/vendors_repository_impl.dart';
import 'package:bazar_group_1/features/search/data/repositories/search_repository_impl.dart';
import 'package:bazar_group_1/features/search/domain/entities/recent_search.dart';
import 'package:bazar_group_1/features/search/domain/entities/search_result.dart';
import 'package:bazar_group_1/features/search/domain/repositories/search_repository.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(
    categoryRepository: ref.watch(categoryRepositoryProvider),
    vendorsRepository: ref.watch(vendorsRepositoryProvider),
    authorsRepository: ref.watch(authorsRepositoryProvider),
  );
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final allSearchableBooksProvider = FutureProvider<List<Book>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getBooks();
});

final searchResultsProvider =
    Provider.family<AsyncValue<List<SearchResult>>, SearchResultType?>(
  (ref, scopeType) {
    final query = ref.watch(searchQueryProvider);
    final booksAsync = ref.watch(allSearchableBooksProvider);

    return booksAsync.whenData((books) {
      if (query.isEmpty) return <SearchResult>[];
      final lowerQuery = query.toLowerCase();

      return books
          .where((b) => b.title.toLowerCase().contains(lowerQuery))
          .map((b) => SearchResult(
                id: b.id,
                title: b.title,
                subtitle: '\$${b.price.toStringAsFixed(2)}',
                imageUrl: b.imageUrl,
                type: SearchResultType.book,
              ))
          .toList();
    });
  },
);

final recentSearchesProvider = FutureProvider<List<RecentSearch>>((ref) async {
  final repository = ref.watch(searchRepositoryProvider);
  return repository.getRecentSearches();
});