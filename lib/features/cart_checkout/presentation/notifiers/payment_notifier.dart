import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_state.dart';

export 'package:bazar_group_1/features/cart_checkout/presentation/notifiers/payment_state.dart';

class PaymentNotifier extends Notifier<PaymentMethodState> {
  @override
  PaymentMethodState build() {
    return const PaymentMethodState();
  }

  void selectCash() {
    state = state.copyWith(type: PaymentType.cash);
  }

  void selectCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  }) {
    state = PaymentMethodState(
      type: PaymentType.card,
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
      cvv: cvv,
    );
  }
}

