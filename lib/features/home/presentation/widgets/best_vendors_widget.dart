import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';

final mockVendorsProvider = Provider<List<Vendor>>((ref) {
  final vendors = [
    Vendor(name: 'Penguin Books', imageUrl: null, rating: 4.5),
    Vendor(name: 'HarperCollins', imageUrl: null, rating: 4.2),
    Vendor(name: 'Springer', imageUrl: null, rating: 3.8),
    Vendor(name: 'Elsevier', imageUrl: null, rating: 4.0),
  ];
  vendors.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
  return vendors;
});

class BestVendorsWidget extends ConsumerWidget {
  const BestVendorsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(mockVendorsProvider);
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
                'Best Vendors',
                style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.vendorsPage);
                },
                child: Text(
                  'See all',
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
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: vendors.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: screenWidth * (8 / 375)),
            itemBuilder: (context, index) {
              final vendor = vendors[index];

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
          ),
        ),
      ],
    );
  }
}