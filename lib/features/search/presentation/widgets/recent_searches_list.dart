import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/search/presentation/providers/search_providers.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class RecentSearchesList extends ConsumerWidget {
  final ValueChanged<String> onTapRecent;

  const RecentSearchesList({super.key, required this.onTapRecent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final recentAsync = ref.watch(recentSearchesProvider);

    return recentAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const SizedBox.shrink(),
      data: (recentSearches) {
        if (recentSearches.isEmpty) {
          return const SizedBox.shrink();
        }
        return ListView.separated(
          itemCount: recentSearches.length + 1,
          separatorBuilder: (context, index) {
            if (index == 0) return const SizedBox(height: 24);
            return Divider(color: colorScheme.outlineVariant, height: 32);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return Text(
                S.of(context).recentSearchesTitle,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: 0.3,
                  color: colorScheme.onSurface,
                ),
              );
            }
            final recent = recentSearches[index - 1];
            return GestureDetector(
              onTap: () => onTapRecent(recent.query),
              child: Text(
                recent.query,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            );
          },
        );
      },
    );
  }
}