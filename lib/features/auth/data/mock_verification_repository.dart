import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';

class MockVerificationRepository implements VerificationRepository {
  @override
  Future<bool> verifyCode(String code) async {
    await Future.delayed(const Duration(seconds: 2));
    return code == '2855';
  }

  @override
  Future<void> resendCode() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}