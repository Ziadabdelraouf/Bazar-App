import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:bazar_group_1/features/categories/presentation/providers/category_providers.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class CategoryTabsBar extends ConsumerWidget {
  final List<Category> categories;

  const CategoryTabsBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedCategoryIdProvider);
    final locale = Localizations.localeOf(context).languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          final isAllTab = index == 0;
          final id = isAllTab ? 'all' : categories[index - 1].id;
          final label = isAllTab
              ? S.of(context).allCategoryTab
              : (locale == 'ar'
                  ? categories[index - 1].nameAr
                  : categories[index - 1].nameEn);
          final isSelected = selectedId == id;

          return GestureDetector(
            onTap: () {
              ref.read(selectedCategoryIdProvider.notifier).state = id;
            },
            child: Center(
              child: Text(
                label,
                style: isSelected
                    ? const TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        height: 1.35,
                        letterSpacing: -0.54,
                      ).copyWith(color: colorScheme.onSurface)
                    : const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                      ).copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
          );
        },
      ),
    );
  }
}