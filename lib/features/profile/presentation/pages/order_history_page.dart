import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/features/profile/domain/entities/order_history_item.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/order_history_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/order_history_item_card.dart';

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderHistoryProvider);
    final groupedOrders = _groupByMonth(orders);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text(
                      S.of(context).orderHistoryPageTitle,
                      style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
            Expanded(
              child: orders.isEmpty
                  ? Center(child: Text(S.of(context).noOrdersYet))
                  : ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      children: groupedOrders.entries.map((entry) {
                        return _buildMonthSection(context, entry.key, entry.value);
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, List<OrderHistoryItem>> _groupByMonth(List<OrderHistoryItem> orders) {
    final sorted = List<OrderHistoryItem>.from(orders)
      ..sort((a, b) => b.orderDate.compareTo(a.orderDate));

    final Map<String, List<OrderHistoryItem>> grouped = {};
    for (final order in sorted) {
      grouped.putIfAbsent(order.monthLabel, () => []).add(order);
    }

    return grouped;
  }

  Widget _buildMonthSection(
    BuildContext context,
    String monthLabel,
    List<OrderHistoryItem> orders,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            monthLabel,
            style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 500) {
                  return _buildOrdersList(orders);
                }
                return _buildOrdersGrid(orders);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<OrderHistoryItem> orders) {
    return Column(
      children: [
        for (int i = 0; i < orders.length; i++) ...[
          OrderHistoryItemCard(order: orders[i]),
          if (i < orders.length - 1)
            Divider(
              color: AppColors.grey200,
              thickness: 1,
              height: 1,
            ),
        ],
      ],
    );
  }

  Widget _buildOrdersGrid(List<OrderHistoryItem> orders) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderHistoryItemCard(order: orders[index]);
      },
    );
  }
}