import 'package:bazar_group_1/features/auth/data/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final userProfileProvider = FutureProvider<Map<String, String>>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return await authService.getUserProfile();
});
