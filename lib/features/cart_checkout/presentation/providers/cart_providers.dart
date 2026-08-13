import 'package:bazar_group_1/features/cart_checkout/data/datasources/cart_local_data_source.dart';
import 'package:bazar_group_1/features/cart_checkout/data/repositories/cart_repository_impl.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/repositories/cart_repository.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/cart_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/delivery_date_time_notifier.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/cart_notifier.dart';
export 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/delivery_date_time_notifier.dart';
export 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_notifier.dart';

final cartLocalDataSourceProvider = Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSourceImpl();
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepositoryImpl(localDataSource: localDataSource);
});

final cartNotifierProvider =
    AsyncNotifierProvider<CartNotifier, List<CartItem>>(CartNotifier.new);

final deliveryDateTimeNotifierProvider =
    NotifierProvider<DeliveryDateTimeNotifier, DeliveryDateTimeState>(
  DeliveryDateTimeNotifier.new,
);

final paymentNotifierProvider =
    NotifierProvider<PaymentNotifier, PaymentMethodState>(
  PaymentNotifier.new,
);

