import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/home/presentation/notifiers/vendors_notifier.dart';

class BestVendorsWidget extends StatelessWidget {
  const BestVendorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final itemSize = context.responsiveValue<double>(
      mobile: 80.0,
      tablet: 96.0,
      desktop: 108.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).bestVendorsTitle,
              style: AppTextStyles.h5.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.grey900,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.vendorsPage);
              },
              child: Text(
                S.of(context).seeAllButton,
                style: AppTextStyles.body14SemiBold.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: itemSize,
          child: Consumer(
            builder: (context, ref, child) {
              final vendorsAsync = ref.watch(vendorsNotifierProvider);

              return vendorsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text(S.of(context).couldNotLoadVendors)),
                data: (vendors) {
                  if (vendors.isEmpty) {
                    return Center(child: Text(S.of(context).noVendorsFound));
                  }

                  final sorted = List.of(vendors)
                    ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
                  final bestFour = sorted.take(4).toList();

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestFour.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final vendor = bestFour[index];

                      return Container(
                        width: itemSize,
                        height: itemSize,
                        decoration: BoxDecoration(
                          color: AppColors.grey100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: vendor.imageUrl != null
                              ? Tooltip(
                                  message: vendor.name,
                                  child: Image.network(
                                    vendor.imageUrl!,
                                    fit: BoxFit.contain,
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
                                      style: AppTextStyles.body14Bold.copyWith(
                                        color: AppColors.grey900,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
