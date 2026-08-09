import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_verification_header.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_verification_pending_card.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_verification_verified_card.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';

class SignUpVerificationEmail extends ConsumerStatefulWidget {
  final String email;

  const SignUpVerificationEmail({super.key, required this.email});

  @override
  ConsumerState<SignUpVerificationEmail> createState() =>
      _SignUpVerificationEmailState();
}

class _SignUpVerificationEmailState
    extends ConsumerState<SignUpVerificationEmail>
    with SingleTickerProviderStateMixin {
  Timer? _verificationTimer;
  Timer? _cooldownTimer;

  bool _isVerified = false;
  bool _isResending = false;
  int _cooldownSeconds = 0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _startEmailVerificationCheck();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
  }

  void _startEmailVerificationCheck() {
    _checkEmailVerified();
    _verificationTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _checkEmailVerified();
    });
  }

  Future<void> _checkEmailVerified() async {
    if (_isVerified) return;
    try {
      final authService = ref.read(authServiceProvider);
      final user = authService.currentUser;
      if (user != null) {
        await user.reload();
        final updatedUser = authService.currentUser;
        if (updatedUser != null && updatedUser.emailVerified) {
          _verificationTimer?.cancel();
          if (mounted) {
            setState(() {
              _isVerified = true;
            });
            _animationController.forward();
          }
        }
      }
    } catch (e) {
      debugPrint('Error reloading user during email verification check: $e');
    }
  }

  Future<void> _handleResend() async {
    if (_isResending || _cooldownSeconds > 0) return;

    setState(() => _isResending = true);
    try {
      await ref.read(authServiceProvider).sendEmailVerification();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S.of(context).verificationLinkSentAgain,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.grey900,
          ),
        );
        _startCooldownTimer();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S.of(context).failedToResendVerificationLink(e.toString()),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }

  void _startCooldownTimer() {
    setState(() => _cooldownSeconds = 30);
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds == 0) {
        timer.cancel();
      } else {
        setState(() => _cooldownSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _verificationTimer?.cancel();
    _cooldownTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppResponsiveBreakpoints.maxAuthCardWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBackButton(),
                  const SizedBox(height: 32),
                  SignUpVerificationHeader(
                    isVerified: _isVerified,
                    email: widget.email,
                  ),
                  const SizedBox(height: 36),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: _isVerified
                        ? SignUpVerificationVerifiedCard(
                            key: const ValueKey('verified_card'),
                            scaleAnimation: _scaleAnimation,
                            onContinue: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.phoneNumberInput,
                              );
                            },
                          )
                        : SignUpVerificationPendingCard(
                            key: const ValueKey('pending_card'),
                            isResending: _isResending,
                            cooldownSeconds: _cooldownSeconds,
                            onResend: _handleResend,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
