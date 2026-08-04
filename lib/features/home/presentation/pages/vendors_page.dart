import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/features/home/presentation/notifiers/vendors_notifier.dart';

final selectedVendorCategoryProvider = StateProvider<String>((ref) => 'All');

List<Map<String, String>> _getVendorCategories(BuildContext context) {
  return [
    {'label': S.of(context).allCategoryTab, 'value': 'All'},
    {'label': S.of(context).booksCategoryTab, 'value': 'books'},
    {'label': S.of(context).poemsCategoryTab, 'value': 'poems'},
    {'label': S.of(context).specialForYouCategoryTab, 'value': 'special for you'},
    {'label': S.of(context).stationeryCategoryTab, 'value': 'stationery'},
  ];
}

class VendorsPage extends ConsumerWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsNotifierProvider);
    final selectedCategory = ref.watch(selectedVendorCategoryProvider);
    final categories = _getVendorCategories(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final crossAxisCount = context.responsiveValue<int>(
      mobile: 3,
      tablet: 4,
      desktop: 6,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(
        title: S.of(context).vendorsPageTitle,
        leadingWidget: Transform.flip(
          flipX: isRtl,
          child: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
        onLeadingPressed: () => Navigator.pop(context),
        trailingWidget: SvgPicture.asset(
          AppIcons.search,
          colorFilter: const ColorFilter.mode(Color(0xFF121212), BlendMode.srcIn),
        ),
        onTrailingPressed: () {
          Navigator.pushNamed(context, AppRoutes.vendorsSearchPage);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                S.of(context).ourVendorsSubtitle,
                style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
              ),
              Text(
                S.of(context).vendorsPageTitle,
                style: AppTextStyles.h4.copyWith(color: AppColors.primary500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 24,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 24),
                  itemBuilder: (context, index) {
                    final categoryData = categories[index];
                    final isSelected = categoryData['value'] == selectedCategory;

                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedVendorCategoryProvider.notifier).state =
                            categoryData['value']!;
                        final category = categoryData['value']!;
                        ref.read(vendorsNotifierProvider.notifier).loadVendors(
                              category: category == 'All' ? null : category,
                            );
                      },
                      child: Text(
                        categoryData['label']!,
                        style: isSelected
                            ? AppTextStyles.h5.copyWith(color: AppColors.grey900)
                            : AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: vendorsAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: Text(S.of(context).couldNotLoadVendors),
                  ),
                  data: (vendors) {
                    if (vendors.isEmpty) {
                      return Center(child: Text(S.of(context).noVendorsFound));
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 101 / 158,
                      ),
                      itemCount: vendors.length,
                      itemBuilder: (context, index) {
                        final vendor = vendors[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.grey50,
                                  borderRadius: BorderRadius.circular(7.03),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.03),
                                  child: vendor.imageUrl != null
                                      ? Tooltip(
                                          message: vendor.name,
                                          child: Image.network(
                                            vendor.imageUrl!,
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, error, stackTrace) =>
                                                Center(
                                              child: Text(
                                                vendor.name,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles.body14Bold
                                                    .copyWith(color: AppColors.primary500),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Tooltip(
                                          message: vendor.name,
                                          child: Center(
                                            child: Text(
                                              vendor.name,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.body14Bold
                                                  .copyWith(color: AppColors.primary500),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Tooltip(
                              message: vendor.name,
                              child: Text(
                                vendor.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyles.body16Medium.copyWith(color: AppColors.grey900),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(5, (starIndex) {
                                final rating = vendor.rating ?? 0;
                                final isFilled = starIndex < rating.round();

                                return Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    end: starIndex < 4 ? 4 : 0,
                                  ),
                                  child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppIcons.star,
                                        width: 13.33,
                                        height: 13.33,
                                        colorFilter: ColorFilter.mode(
                                          isFilled ? AppColors.yellow : AppColors.grey900,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}