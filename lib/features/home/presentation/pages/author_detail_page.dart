import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/components/rating/rating_stars.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_card.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/author.dart';

class AuthorDetailPage extends StatelessWidget {
  const AuthorDetailPage({super.key, this.author});

  final Author? author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBackBar(
        title: author?.name ?? "",
        leadingWidget: SvgPicture.asset(AppIcons.arrowLeftOutline),
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    AuthorCard(author: author!, showDetails: false),
                    SizedBox(height: 10),
                    Text(
                      author?.role ?? "",
                      style: AppTextStyles.body16Regular.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      author!.name,
                      style: AppTextStyles.h4.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16),
                    RatingStars(rating: 4, size: 28, showRatingNumbers: true),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Text(
                S.of(context).about,
                textAlign: TextAlign.left,
                style: AppTextStyles.h6.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 14),

              Container(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: [
                    Text(
                      author!.role,
                      style: AppTextStyles.body14Regular.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                S.of(context).products,
                style: AppTextStyles.h6.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8),
              AuthorProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
