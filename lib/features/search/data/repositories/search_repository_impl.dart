import 'package:bazar_group_1/features/categories/domain/repositories/category_repository.dart';
import 'package:bazar_group_1/features/home/domain/repositories/authors_repository.dart';
import 'package:bazar_group_1/features/home/domain/repositories/vendors_repository.dart';
import 'package:bazar_group_1/features/search/domain/entities/recent_search.dart';
import 'package:bazar_group_1/features/search/domain/entities/search_result.dart';
import 'package:bazar_group_1/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final CategoryRepository categoryRepository;
  final VendorsRepository vendorsRepository;
  final AuthorsRepository authorsRepository;

  static final List<RecentSearch> _recentSearches = [];

  SearchRepositoryImpl({
    required this.categoryRepository,
    required this.vendorsRepository,
    required this.authorsRepository,
  });

  @override
  Future<List<SearchResult>> search({
    required String query,
    required SearchResultType? scopeType,
  }) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return [];

    final lowerQuery = trimmedQuery.toLowerCase();
    final needsBooks = scopeType == null || scopeType == SearchResultType.book;
    final needsVendors = scopeType == null || scopeType == SearchResultType.vendor;
    final needsAuthors = scopeType == null || scopeType == SearchResultType.author;

    final booksFuture = needsBooks ? categoryRepository.getBooks() : null;
    final vendorsFuture = needsVendors ? vendorsRepository.getVendors() : null;
    final authorsFuture = needsAuthors ? authorsRepository.getAuthors() : null;

    await Future.wait([
      ?booksFuture,
      ?vendorsFuture,
      ?authorsFuture,
    ]);

    final List<SearchResult> results = [];

    if (booksFuture != null) {
      final books = await booksFuture;
      results.addAll(
        books
            .where((b) => b.title.toLowerCase().contains(lowerQuery))
            .map((b) => SearchResult(
                  id: b.id,
                  title: b.title,
                  subtitle: '\$${b.price.toStringAsFixed(2)}',
                  imageUrl: b.imageUrl,
                  type: SearchResultType.book,
                )),
      );
    }

    if (vendorsFuture != null) {
      final vendors = await vendorsFuture;
      results.addAll(
        vendors
            .where((v) => v.name.toLowerCase().contains(lowerQuery))
            .map((v) => SearchResult(
                  id: v.name,
                  title: v.name,
                  subtitle: v.rating != null ? '⭐ ${v.rating}' : '',
                  imageUrl: v.imageUrl ?? '',
                  type: SearchResultType.vendor,
                )),
      );
    }

    if (authorsFuture != null) {
      final authors = await authorsFuture;
      results.addAll(
        authors
            .where((a) => a.name.toLowerCase().contains(lowerQuery))
            .map((a) => SearchResult(
                  id: a.name,
                  title: a.name,
                  subtitle: a.role,
                  imageUrl: a.image,
                  type: SearchResultType.author,
                )),
      );
    }

    return results;
  }

  @override
  Future<List<RecentSearch>> getRecentSearches() async {
    return _recentSearches.reversed.toList();
  }

  @override
  Future<void> addRecentSearch(String query) async {
    _recentSearches.removeWhere((r) => r.query == query);
    _recentSearches.add(RecentSearch(query: query, searchedAt: DateTime.now()));
  }

  @override
  Future<void> clearRecentSearches() async {
    _recentSearches.clear();
  }
}