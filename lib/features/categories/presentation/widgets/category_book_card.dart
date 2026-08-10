import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class CategoryBookCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final VoidCallback? onTap;

  const CategoryBookCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imagePath.isNotEmpty
                    ? Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      )
                    : const Icon(Icons.book),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body14Medium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            price,
            style: AppTextStyles.body14Bold.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}