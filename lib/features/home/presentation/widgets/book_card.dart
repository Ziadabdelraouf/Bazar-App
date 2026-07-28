import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/presentation/pages/detail_menu_page.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  const BookCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => DetailMenuPage(
            title: title,
            price: price,
            imagePath: imagePath,
            brandLogo: 'assets/icons/GoodDay_Vector.svg',
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (127 / 375),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * (127 / 375),
              height: MediaQuery.of(context).size.height * (150 / 812),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: imagePath.isNotEmpty
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                    )
                  : const Icon(Icons.book),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body14Medium.copyWith(
                color: AppColors.grey900,
              ),
            ),
            Text(price),
          ],
        ),
      ),
    );
  }
}
