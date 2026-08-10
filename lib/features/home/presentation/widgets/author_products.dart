import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/domain/entities/author_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorProducts extends ConsumerWidget {
  const AuthorProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _dummyProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 230,
      ),
      itemBuilder: (context, index) {
        final product = _dummyProducts[index];
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 158,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                    bottom: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Center(
                          child: Icon(
                            Icons.book,
                            size: 40,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body14Bold.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.price,
                      style: AppTextStyles.body14Bold.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

const List<AuthorProduct> _dummyProducts = [
  AuthorProduct(
    title: 'The Silent Patient',
    price: '\$24.99',
    imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
  ),
  AuthorProduct(
    title: 'Atomic Habits',
    price: '\$18.50',
    imageUrl:
        'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400',
  ),
  AuthorProduct(
    title: 'Psychology of Money',
    price: '\$20.00',
    imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400',
  ),
  AuthorProduct(
    title: 'Deep Work',
    price: '\$22.00',
    imageUrl:
        'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=400',
  ),
  AuthorProduct(
    title: 'Thinking, Fast and Slow',
    price: '\$26.00',
    imageUrl:
        'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=400',
  ),
  AuthorProduct(
    title: 'Rich Dad Poor Dad',
    price: '\$16.99',
    imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400',
  ),
];
