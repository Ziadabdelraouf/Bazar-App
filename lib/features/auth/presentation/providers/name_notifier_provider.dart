import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameNotifierProvider =
    StateNotifierProvider<NameNotifier, String>(
  (ref) => NameNotifier(),
);
