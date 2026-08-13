import 'package:bazar_group_1/features/search/domain/entities/search_result.dart';
import 'package:bazar_group_1/features/search/domain/entities/recent_search.dart';

abstract class SearchRepository {
  Future<List<SearchResult>> search({
    required String query,
    required SearchResultType? scopeType,
  });

  Future<List<RecentSearch>> getRecentSearches();

  Future<void> addRecentSearch(String query);

  Future<void> clearRecentSearches();
}