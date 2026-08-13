import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<List<CartItem>> addToCart(CartItem item);
  Future<List<CartItem>> updateQuantity(String title, int quantity);
  Future<List<CartItem>> removeItem(String title);
  Future<List<CartItem>> clearCart();
}
