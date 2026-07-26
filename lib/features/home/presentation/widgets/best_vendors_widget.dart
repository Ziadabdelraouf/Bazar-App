import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/home/presentation/notifiers/vendors_notifier.dart';

class BestVendorsWidget extends ConsumerWidget {
  const BestVendorsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsNotifierProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * (327 / 375),
          height: screenHeight * (24 / 812),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).bestVendorsTitle,
                style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.vendorsPage);
                },
                child: Text(
                  S.of(context).seeAllButton,
                  style: AppTextStyles.body14Bold
                      .copyWith(color: AppColors.primary500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * (16 / 812)),
        SizedBox(
          width: screenWidth * (351 / 375),
          height: screenHeight * (80 / 812),
          child: vendorsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
              child: Text(S.of(context).couldNotLoadVendors),
            ),
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
                    SizedBox(width: screenWidth * (8 / 375)),
                itemBuilder: (context, index) {
                  final vendor = bestFour[index];

                  return Container(
                    width: screenWidth * (80 / 375),
                    height: screenHeight * (80 / 812),
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: vendor.imageUrl != null
                          ? Image.network(vendor.imageUrl!, fit: BoxFit.contain)
                          : Center(
                              child: Text(
                                vendor.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.body14Bold
                                    .copyWith(color: AppColors.grey900),
                              ),
                            ),
                    ),
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