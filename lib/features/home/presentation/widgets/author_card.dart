import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/author.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.author,
    this.onTap,
    this.showDetails = true,
  });

  final Author author;
  final VoidCallback? onTap;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.authorDetailPage, arguments: author);
          },
      borderRadius: BorderRadius.circular(60),
      child: SizedBox(
        width: 115,
        child: Column(
          children: [
            ClipOval(
              child: SizedBox(
                width: 115,
                height: 115,
                child: _buildAuthorImage(),
              ),
            ),
            if (showDetails) ...[
              const SizedBox(height: 8),
              Text(
                author.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16Medium.copyWith(
                  color: AppColors.grey900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                author.role,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.body14Regular.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorImage() {
    if (author.image.isEmpty) {
      return _buildPlaceholder();
    }

    if (author.image.startsWith('http')) {
      return Image.network(
        author.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    }

    return Image.asset(
      author.image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _buildPlaceholder();
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: const Icon(Icons.person, size: 50),
    );
  }
}
