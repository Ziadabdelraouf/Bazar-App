import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/profile/domain/entities/order_history_item.dart';

final orderHistoryProvider = Provider<List<OrderHistoryItem>>((ref) {
  return [
    OrderHistoryItem(
      title: 'The Da Vinci Code',
      status: OrderStatus.delivered,
      itemCount: 1,
      orderDate: DateTime(2021, 10, 15),
    ),
    OrderHistoryItem(
      title: 'Carrie Fisher',
      status: OrderStatus.delivered,
      itemCount: 5,
      orderDate: DateTime(2021, 10, 8),
    ),
    OrderHistoryItem(
      title: 'The Waiting',
      status: OrderStatus.cancelled,
      itemCount: 2,
      orderDate: DateTime(2021, 10, 3),
    ),
    OrderHistoryItem(
      title: 'A Genuinely Very Long Book Title For Testing Text Overflow',
      status: OrderStatus.delivered,
      itemCount: 1,
      orderDate: DateTime(2021, 9, 20),
    ),
    OrderHistoryItem(
      title: 'Norwegian Wood',
      status: OrderStatus.delivered,
      itemCount: 3,
      orderDate: DateTime(2021, 9, 5),
    ),
    OrderHistoryItem(
      title: 'Educated',
      status: OrderStatus.cancelled,
      itemCount: 1,
      orderDate: DateTime(2021, 8, 12),
    ),
  ];
});