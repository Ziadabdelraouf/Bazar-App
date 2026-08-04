enum OrderStatus { delivered, cancelled }

class OrderHistoryItem {
  final String title;
  final String? imageUrl;
  final OrderStatus status;
  final int itemCount;
  final DateTime orderDate;

  OrderHistoryItem({
    required this.title,
    this.imageUrl,
    required this.status,
    required this.itemCount,
    required this.orderDate,
  });

}