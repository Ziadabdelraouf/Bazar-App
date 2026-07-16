// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the '//Buttons Strings//' key

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Sign in`
  String get signInButton {
    return Intl.message('Sign in', name: 'signInButton', desc: '', args: []);
  }

  /// `Skip`
  String get skipButton {
    return Intl.message('Skip', name: 'skipButton', desc: '', args: []);
  }

  // skipped getter for the '//OnBoarding one Screen Strings//' key

  /// `Now reading books will be easier`
  String get onboardingOneTitle {
    return Intl.message(
      'Now reading books will be easier',
      name: 'onboardingOneTitle',
      desc: '',
      args: [],
    );
  }

  /// ` Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.`
  String get onboardingOneDescription {
    return Intl.message(
      ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
      name: 'onboardingOneDescription',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//OnBoarding Two Screen Strings//' key

  // skipped getter for the '//Verification Screen Strings//' key

  /// `Verification Code`
  String get verificationCodeTitle {
    return Intl.message(
      'Verification Code',
      name: 'verificationCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification Email`
  String get verificationEmailTitle {
    return Intl.message(
      'Verification Email',
      name: 'verificationEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification Phone`
  String get verificationPhoneTitle {
    return Intl.message(
      'Verification Phone',
      name: 'verificationPhoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code we just sent to email `
  String get verificationSentToEmail {
    return Intl.message(
      'Please enter the code we just sent to email ',
      name: 'verificationSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code we just sent to phone number `
  String get verificationSentToPhone {
    return Intl.message(
      'Please enter the code we just sent to phone number ',
      name: 'verificationSentToPhone',
      desc: '',
      args: [],
    );
  }

  /// `If you didn't receive a code? `
  String get resendCodePrompt {
    return Intl.message(
      'If you didn\'t receive a code? ',
      name: 'resendCodePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendButton {
    return Intl.message('Resend', name: 'resendButton', desc: '', args: []);
  }

  /// `Incorrect code, please try again.`
  String get incorrectCodeError {
    return Intl.message(
      'Incorrect code, please try again.',
      name: 'incorrectCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Code resent!`
  String get codeResentMessage {
    return Intl.message(
      'Code resent!',
      name: 'codeResentMessage',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Phone Number Screen Strings//' key

  /// `Phone Number`
  String get phoneNumberTitle {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number, so we can more easily deliver your order`
  String get phoneNumberDescription {
    return Intl.message(
      'Please enter your phone number, so we can more easily deliver your order',
      name: 'phoneNumberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumberPlaceholder {
    return Intl.message(
      'Phone number',
      name: 'phoneNumberPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get emptyPhoneNumberError {
    return Intl.message(
      'Please enter your phone number',
      name: 'emptyPhoneNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidPhoneNumberError {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidPhoneNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountryTitle {
    return Intl.message(
      'Select Country',
      name: 'selectCountryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search country or code`
  String get searchCountryHint {
    return Intl.message(
      'Search country or code',
      name: 'searchCountryHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
