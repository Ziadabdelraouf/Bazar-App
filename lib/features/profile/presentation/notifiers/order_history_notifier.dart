import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/profile/domain/entities/order_history_item.dart';

final orderHistoryProvider = Provider<List<OrderHistoryItem>>((ref) {
  return [
    OrderHistoryItem(
      title: 'The Da Vinci Code',
      status: OrderStatus.delivered,
      itemCount: 1,
      monthLabel: 'October 2021',
    ),
    OrderHistoryItem(
      title: 'Carrie Fisher',
      status: OrderStatus.delivered,
      itemCount: 5,
      monthLabel: 'October 2021',
    ),
    OrderHistoryItem(
      title: 'The Waiting',
      status: OrderStatus.cancelled,
      itemCount: 2,
      monthLabel: 'October 2021',
    ),
  ];
});