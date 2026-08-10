import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends AsyncNotifier<List<CartItem>> {
  @override
  Future<List<CartItem>> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    return repository.getCartItems();
  }

  Future<void> addToCart(CartItem item) async {
    final repository = ref.read(cartRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return repository.addToCart(item);
    });
  }

  Future<void> updateQuantity(String title, int quantity) async {
    final repository = ref.read(cartRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return repository.updateQuantity(title, quantity);
    });
  }

  Future<void> incrementQuantity(String title) async {
    final items = state.value ?? [];
    for (final item in items) {
      if (item.title == title) {
        await updateQuantity(title, item.quantity + 1);
        break;
      }
    }
  }

  Future<void> decrementQuantity(String title) async {
    final items = state.value ?? [];
    for (final item in items) {
      if (item.title == title) {
        if (item.quantity > 1) {
          await updateQuantity(title, item.quantity - 1);
        } else {
          await removeItem(title);
        }
        break;
      }
    }
  }

  Future<void> removeItem(String title) async {
    final repository = ref.read(cartRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return repository.removeItem(title);
    });
  }

  Future<void> clearCart() async {
    final repository = ref.read(cartRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return repository.clearCart();
    });
  }
}

final cartNotifierProvider =
    AsyncNotifierProvider<CartNotifier, List<CartItem>>(CartNotifier.new);
