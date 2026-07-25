import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/authors_provider.dart';
import 'author_list_view_widget.dart';

class AuthorWidget extends ConsumerWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorsState = ref.watch(authorsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Authors',
                style: AppTextStyles.h5.copyWith(
                  color: AppColors.grey900,
                ),
              ),
            ),
            Text(
              'See all',
              style: AppTextStyles.body14Bold.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        authorsState.when(
          loading: () {
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          data: (authors) {
            if (authors.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: Text('No authors found'),
                ),
              );
            }

            return AuthorListViewWidget(
              authors: authors,
            );
          },
          error: (error, stackTrace) {
            return SizedBox(
              height: 120,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    ref.invalidate(authorsProvider);
                  },
                  child: const Text('Retry'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}