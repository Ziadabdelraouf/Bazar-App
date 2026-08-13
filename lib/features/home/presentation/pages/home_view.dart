import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/top_of_week_section.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_widget.dart';
import 'package:bazar_group_1/features/categories/presentation/providers/category_providers.dart';
import 'package:bazar_group_1/features/search/presentation/providers/search_providers.dart';
import 'package:bazar_group_1/features/search/presentation/widgets/inline_search_field.dart';
import 'package:bazar_group_1/features/search/presentation/widgets/recent_searches_list.dart';
import 'package:bazar_group_1/features/categories/presentation/widgets/category_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSearch = ref.watch(bookSearchShowProvider);
    final searchQuery = ref.watch(bookSearchQueryProvider);

    if (showSearch) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InlineSearchField(
              hintText: S.of(context).searchHint,
              onChanged: (value) {
                ref.read(bookSearchQueryProvider.notifier).state =
                    value.trim();
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: searchQuery.isEmpty
                  ? RecentSearchesList(
                      onTapRecent: (value) {
                        ref.read(bookSearchQueryProvider.notifier).state =
                            value;
                      },
                    )
                  : Consumer(
                      builder: (context, ref, child) {
                        final booksAsync = ref.watch(categoryBooksProvider);
                        return booksAsync.when(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (error, stackTrace) => Center(
                            child: Text(S.of(context).couldNotLoadVendors),
                          ),
                          data: (books) {
                            final filteredBooks = books
                                .where((b) => b.title
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()))
                                .toList();

                            if (filteredBooks.isEmpty) {
                              return Center(
                                  child: Text(S.of(context).noBooksFound));
                            }

                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.72,
                              ),
                              itemCount: filteredBooks.length,
                              itemBuilder: (context, index) {
                                final book = filteredBooks[index];
                                return CategoryBookCard(
                                  book: book,
                                  onBeforeOpen: () {
                                    ref.read(searchRepositoryProvider).addRecentSearch(searchQuery);
                                    ref.invalidate(recentSearchesProvider);
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBackBar(
        title: S.of(context).homeTitle,
        trailingWidget: NotificationIcon(),
        leadingWidget: SvgPicture.asset(AppIcons.search),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpecialOffer(),
            const SizedBox(height: 12),
            const TopOfWeekSection(),
            const SizedBox(height: 12),
            const BestVendorsWidget(),
            const SizedBox(height: 12),
            const AuthorWidget(),
          ],
        ),
      ),
    );
  }
}