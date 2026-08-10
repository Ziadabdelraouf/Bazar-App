import 'package:bazar_group_1/features/cart_checkout/data/datasources/cart_local_data_source.dart';
import 'package:bazar_group_1/features/cart_checkout/data/repositories/cart_repository_impl.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/repositories/cart_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartLocalDataSourceProvider = Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSourceImpl();
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepositoryImpl(localDataSource: localDataSource);
});
