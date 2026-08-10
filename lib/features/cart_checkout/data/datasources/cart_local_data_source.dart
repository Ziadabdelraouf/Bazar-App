import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';

abstract class CartLocalDataSource {
  Future<List<CartItem>> getCartItems();
  Future<List<CartItem>> addToCart(CartItem item);
  Future<List<CartItem>> updateQuantity(String title, int quantity);
  Future<List<CartItem>> removeItem(String title);
  Future<List<CartItem>> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final List<CartItem> _items = [];

  @override
  Future<List<CartItem>> getCartItems() async {
    return List.unmodifiable(_items);
  }

  @override
  Future<List<CartItem>> addToCart(CartItem item) async {
    int existingIndex = -1;
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].title == item.title) {
        existingIndex = i;
        break;
      }
    }

    if (existingIndex >= 0) {
      CartItem existingItem = _items[existingIndex];
      _items[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }

    return List.unmodifiable(_items);
  }

  @override
  Future<List<CartItem>> updateQuantity(String title, int quantity) async {
    if (quantity <= 0) {
      return removeItem(title);
    }

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].title == title) {
        _items[i] = _items[i].copyWith(quantity: quantity);
        break;
      }
    }

    return List.unmodifiable(_items);
  }

  @override
  Future<List<CartItem>> removeItem(String title) async {
    _items.removeWhere((item) => item.title == title);
    return List.unmodifiable(_items);
  }

  @override
  Future<List<CartItem>> clearCart() async {
    _items.clear();
    return List.unmodifiable(_items);
  }
}


