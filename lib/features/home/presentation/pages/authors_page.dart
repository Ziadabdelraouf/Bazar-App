import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/search/presentation/widgets/inline_search_field.dart';
import 'package:bazar_group_1/features/search/presentation/widgets/recent_searches_list.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/author.dart';
import '../providers/authors_provider.dart';
import '../widgets/author_list_item.dart';

class AuthorsPage extends ConsumerStatefulWidget {
  const AuthorsPage({super.key});

  @override
  ConsumerState<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends ConsumerState<AuthorsPage> {
  static const List<String> _categories = [
    'All',
    'Poets',
    'Playwrights',
    'Novelists',
    'Journalists',
  ];

  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    final authorsAsync = ref.watch(authorsProvider);

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(context),

            if (_showSearch)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
                child: InlineSearchField(
                  hintText: S.of(context).searchHint,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.trim();
                    });
                  },
                ),
              ),

            if (_showSearch && _searchQuery.isEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RecentSearchesList(
                    onTapRecent: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                child: Text(
                  S.of(context).checkTheAuthors,
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 18),
                child: Text(
                  S.of(context).authorsTitle,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),

              _buildCategories(),

              const SizedBox(height: 18),

              Expanded(
                child: authorsAsync.when(
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error, stackTrace) {
                    return _buildErrorState(context);
                  },
                  data: (authors) {
                    final filteredAuthors = _filterAuthors(authors);

                    if (filteredAuthors.isEmpty) {
                      return Center(
                        child: Text(
                          S.of(context).noAuthorsFound,
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () {
                        return ref.refresh(authorsProvider.future);
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        itemCount: filteredAuthors.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          return AuthorListItem(author: filteredAuthors[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 22,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Expanded(
            child: Text(
              'Authors',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;

                if (!_showSearch) {
                  _searchQuery = '';
                }
              });
            },
            icon: _showSearch
                ? Icon(Icons.close, size: 25, color: Theme.of(context).colorScheme.onSurface)
                : SvgPicture.asset(
                    AppIcons.search,
                    width: 25,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 28);
        },
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;

          return InkWell(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Column(
              children: [
                Text(
                  _getCategoryLabel(context, category),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isSelected ? 20 : 0,
                  height: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Author> _filterAuthors(List<Author> authors) {
    return authors.where((author) {
      final query = _searchQuery.toLowerCase();

      final matchesSearch =
          query.isEmpty ||
          author.name.toLowerCase().contains(query) ||
          author.role.toLowerCase().contains(query);

      final matchesCategory = _matchesCategory(author);

      return matchesSearch && matchesCategory;
    }).toList();
  }

  bool _matchesCategory(Author author) {
    if (_selectedCategory == 'All') {
      return true;
    }

    final role = author.role.toLowerCase();

    switch (_selectedCategory) {
      case 'Poets':
        return role.contains('poet');

      case 'Playwrights':
        return role.contains('playwright');

      case 'Novelists':
        return role.contains('novelist');

      case 'Journalists':
        return role.contains('journalist');

      default:
        return true;
    }
  }

  String _getCategoryLabel(BuildContext context, String key) {
    final l10n = S.of(context);
    switch (key) {
      case 'All':
        return l10n.allCategoryTab;
      case 'Poets':
        return l10n.poetsCategoryTab;
      case 'Playwrights':
        return l10n.playwrightsCategoryTab;
      case 'Novelists':
        return l10n.novelistsCategoryTab;
      case 'Journalists':
        return l10n.journalistsCategoryTab;
      default:
        return key;
    }
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 40, color: Theme.of(context).colorScheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(S.of(context).unableToLoadAuthors),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              ref.invalidate(authorsProvider);
            },
            child: Text(S.of(context).retryButton),
          ),
        ],
      ),
    );
  }
}