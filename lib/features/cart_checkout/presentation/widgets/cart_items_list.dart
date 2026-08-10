import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/cart_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemsList extends ConsumerWidget {
  final List<CartItem> items;

  const CartItemsList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartNotifierProvider.notifier);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CartItemTile(
          item: item,
          onIncrement: () {
            notifier.incrementQuantity(item.title);
          },
          onDecrement: () {
            notifier.decrementQuantity(item.title);
          },
          onRemove: () {
            notifier.removeItem(item.title);
          },
        );
      },
    );
  }
}
