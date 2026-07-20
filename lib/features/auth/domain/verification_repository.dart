abstract class VerificationRepository {
  Future<bool> verifyCode(String code);
  Future<void> resendCode();
}