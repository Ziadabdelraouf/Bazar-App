import 'package:bazar_group_1/features/cart_checkout/data/datasources/cart_local_data_source.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItem>> getCartItems() {
    return localDataSource.getCartItems();
  }

  @override
  Future<List<CartItem>> addToCart(CartItem item) {
    return localDataSource.addToCart(item);
  }

  @override
  Future<List<CartItem>> updateQuantity(String title, int quantity) {
    return localDataSource.updateQuantity(title, quantity);
  }

  @override
  Future<List<CartItem>> removeItem(String title) {
    return localDataSource.removeItem(title);
  }

  @override
  Future<List<CartItem>> clearCart() {
    return localDataSource.clearCart();
  }
}
