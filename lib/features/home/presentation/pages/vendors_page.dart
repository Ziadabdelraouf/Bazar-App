import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';

final vendorsPageMockProvider = Provider<List<Vendor>>((ref) {
  return [
    Vendor(name: 'Penguin Books', imageUrl: null, rating: 4.5),
    Vendor(name: 'HarperCollins', imageUrl: null, rating: 4.2),
    Vendor(name: 'Springer', imageUrl: null, rating: 3.8),
    Vendor(name: 'Elsevier', imageUrl: null, rating: 4.0),
    Vendor(name: 'Wiley', imageUrl: null, rating: 4.1),
    Vendor(name: 'Macmillan', imageUrl: null, rating: 3.9),
    Vendor(name: 'Scholastic', imageUrl: null, rating: 4.7),
    Vendor(name: 'Hachette', imageUrl: null, rating: 4.3),
    Vendor(name: 'Simon & Schuster', imageUrl: null, rating: 4.0),
    Vendor(name: 'Penguin Books', imageUrl: null, rating: 4.5),
    Vendor(name: 'HarperCollins', imageUrl: null, rating: 4.2),
    Vendor(name: 'Springer', imageUrl: null, rating: 3.8),
    Vendor(name: 'Elsevier', imageUrl: null, rating: 4.0),
    Vendor(name: 'Wiley', imageUrl: null, rating: 4.1),
    Vendor(name: 'Macmillan', imageUrl: null, rating: 3.9),
  ];
});

final selectedVendorCategoryProvider = StateProvider<String>((ref) => 'All');

const List<String> _vendorCategories = [
  'All',
  'Books',
  'Poems',
  'Special for You',
  'Stationery'
];

class VendorsPage extends ConsumerWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(vendorsPageMockProvider);
    final selectedCategory = ref.watch(selectedVendorCategoryProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * (100 / 812),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * (16 / 375)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text(
                      'Vendors',
                      style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
                    ),
                    SvgPicture.asset(
                      AppIcons.search,
                      width: screenWidth * (24 / 375),
                      height: screenWidth * (24 / 375),
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF121212), BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * (359 / 375),
              height: screenHeight * (88 / 812),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * (8 / 375),
                  screenHeight * (16 / 812),
                  screenWidth * (8 / 375),
                  screenHeight * (8 / 812),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * (89 / 375),
                        height: screenHeight * (24 / 812),
                        child: Text(
                          'Our Vendors',
                          style: AppTextStyles.body16Regular
                              .copyWith(color: AppColors.grey500),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * (91 / 375),
                        height: screenHeight * (28 / 812),
                        child: Text(
                          'Vendors',
                          style: AppTextStyles.h4
                              .copyWith(color: AppColors.primary500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (10 / 812)),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * (16 / 375)),
              child: SizedBox(
                width: screenWidth * (351 / 375),
                height: screenHeight * (24 / 812),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _vendorCategories.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: screenWidth * (24 / 375)),
                  itemBuilder: (context, index) {
                    final category = _vendorCategories[index];
                    final isSelected = category == selectedCategory;

                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedVendorCategoryProvider.notifier).state =
                            category;
                      },
                      child: Text(
                        category,
                        style: isSelected
                            ? AppTextStyles.h5.copyWith(color: AppColors.grey900)
                            : AppTextStyles.body16Regular
                                .copyWith(color: AppColors.grey500),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * (12 / 812)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)),
              child: SizedBox(
                width: screenWidth * (327 / 375),
                height: screenHeight * (491 / 812),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: screenWidth * (12 / 375),
                    mainAxisSpacing: screenHeight * (16 / 812),
                    childAspectRatio: 101 / 158,
                  ),
                  itemCount: vendors.length,
                  itemBuilder: (context, index) {
                    final vendor = vendors[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * (101 / 375),
                          height: screenWidth * (101 / 375),
                          decoration: BoxDecoration(
                            color: AppColors.grey50,
                            borderRadius: BorderRadius.circular(7.03),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.03),
                            child: vendor.imageUrl != null
                                ? Image.network(vendor.imageUrl!,
                                    fit: BoxFit.contain)
                                : Center(
                                    child: Text(
                                      vendor.name,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.body14Bold.copyWith(
                                          color: AppColors.primary500),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: screenHeight * (8 / 812)),
                        SizedBox(
                          width: screenWidth * (101 / 375),
                          height: screenHeight * (24 / 812),
                          child: Text(
                            vendor.name,
                            style: AppTextStyles.body16Medium
                                .copyWith(color: AppColors.grey900),
                          ),
                        ),
                        SizedBox(height: screenHeight * (4 / 812)),
                        Row(
                          children: List.generate(5, (starIndex) {
                            final rating = vendor.rating ?? 0;
                            final isFilled = starIndex < rating.round();

                            return Padding(
                              padding: EdgeInsets.only(
                                  right: starIndex < 4
                                      ? screenWidth * (4 / 375)
                                      : 0),
                              child: SizedBox(
                                width: screenWidth * (16 / 375),
                                height: screenWidth * (16 / 375),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.star,
                                    width: screenWidth * (13.33 / 375),
                                    height: screenWidth * (13.33 / 375),
                                    colorFilter: ColorFilter.mode(
                                      isFilled
                                          ? AppColors.yellow
                                          : AppColors.grey900,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}