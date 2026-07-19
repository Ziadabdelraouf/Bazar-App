import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/generated/l10n.dart';
import 'features/auth/presentation/pages/sign_up_verification_email.dart';
import 'features/auth/presentation/pages/forgot_password_verification_email.dart';
import 'features/auth/presentation/pages/forgot_password_verification_phone.dart';

void main() {
  runApp(
    const ProviderScope(
      child: VerificationDemoApp(),
    ),
  );
}

class VerificationDemoApp extends StatelessWidget {
  const VerificationDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("en"), // change to "ar" to demo Arabic
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const TestPickerScreen(),
    );
  }
}

class _PlaceholderCongratulationsScreen extends StatelessWidget {
  const _PlaceholderCongratulationsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.celebration, size: 64, color: Colors.purple),
            const SizedBox(height: 16),
            const Text(
              '🎉 Congratulations! 🎉\n(placeholder - real screen not built yet)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderNewPasswordScreen extends StatelessWidget {
  const _PlaceholderNewPasswordScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_reset, size: 64, color: Colors.purple),
            const SizedBox(height: 16),
            const Text(
              'New Password Screen\n(placeholder - real screen not built yet)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class TestPickerScreen extends StatelessWidget {
  const TestPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification Feature Demo')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up (full chained sequence:\nEmail → Phone → Phone Verify)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignUpVerificationEmail(
                        email: 'Johndoe@gmail.com',
                        onAllVerified: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const _PlaceholderCongratulationsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: const Text('Start Sign Up'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Forgot Password (choice: Email OR Phone)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ForgotPasswordVerificationEmail(
                        email: 'Johndoe@email.com',
                        onVerified: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const _PlaceholderNewPasswordScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: const Text('Forgot Password via Email'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ForgotPasswordVerificationPhone(
                        phoneNumber: '(+965) 123 435 7565',
                        onVerified: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const _PlaceholderNewPasswordScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: const Text('Forgot Password via Phone'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Tip: enter 2855 for a successful verification code.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}