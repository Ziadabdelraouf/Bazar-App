import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingNotifier extends Notifier<int> {
  static const int totalPages = 3;
  
  @override
  int build() {
    return 0;
  }

  void nextPage() {
    if (state < totalPages - 1) {
      state++;
    }
  }

  void gotoPage(int index) {
    if (index >= 0 && index < totalPages) {
      state = index;
    }
  }

  void reset() {
    state = 0;
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, int>(OnboardingNotifier.new);
