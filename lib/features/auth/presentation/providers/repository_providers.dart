import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/auth/domain/verification_repository.dart';
import 'package:bazar_group_1/features/auth/data/mock_verification_repository.dart';

final verificationRepositoryProvider = Provider<VerificationRepository>(
  (ref) => MockVerificationRepository(),
);