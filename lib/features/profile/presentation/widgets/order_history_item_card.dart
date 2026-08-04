import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/domain/entities/order_history_item.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class OrderHistoryItemCard extends StatelessWidget {
  const OrderHistoryItemCard({super.key, required this.order});

  final OrderHistoryItem order;

  @override
  Widget build(BuildContext context) {
    final statusColor =
        order.status == OrderStatus.delivered ? AppColors.green : AppColors.red;
    final localization = S.of(context);
    final statusText = order.status == OrderStatus.delivered
        ? localization.deliveredStatus
        : localization.cancelledStatus;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: order.imageUrl != null
            ? Image.network(
                order.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              )
            : const Icon(Icons.menu_book),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyles.body16SemiBold.copyWith(color: AppColors.grey900),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    statusText,
                    style: AppTextStyles.body14Medium.copyWith(color: statusColor),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppColors.grey200,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    localization.itemsCount(order.itemCount),
                    style: AppTextStyles.body14Medium.copyWith(color: AppColors.grey500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}