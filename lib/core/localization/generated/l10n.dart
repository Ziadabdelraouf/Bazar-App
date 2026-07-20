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

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Skip`
  String get skipButton {
    return Intl.message('Skip', name: 'skipButton', desc: '', args: []);
  }

  /// `Get Started`
  String get getStartedButton {
    return Intl.message(
      'Get Started',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//SignInPage Strings//' key

  /// `Welcome Back `
  String get welcomeBackTitle {
    return Intl.message(
      'Welcome Back ',
      name: 'welcomeBackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signInSubtitle {
    return Intl.message(
      'Sign in to your account',
      name: 'signInSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `Your Email`
  String get emailPlaceholder {
    return Intl.message(
      'Your Email',
      name: 'emailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Your Password`
  String get passwordPlaceholder {
    return Intl.message(
      'Your Password',
      name: 'passwordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordButton {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccountText {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message('Sign Up', name: 'signUpButton', desc: '', args: []);
  }

  /// `or`
  String get orSeparator {
    return Intl.message('or', name: 'orSeparator', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogleButton {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithAppleButton {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithAppleButton',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//SuccessPage//' key

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `your account is complete, Please enjoy the best menu from us.`
  String get successBody {
    return Intl.message(
      'your account is complete, Please enjoy the best menu from us.',
      name: 'successBody',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed!`
  String get PasswordChanged {
    return Intl.message(
      'Password Changed!',
      name: 'PasswordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Your password changed successfully, you can login again with a new password`
  String get PasswordChangedBody {
    return Intl.message(
      'Your password changed successfully, you can login again with a new password',
      name: 'PasswordChangedBody',
      desc: '',
      args: [],
    );
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

  /// `Your Bookish Soulmate Awaits`
  String get onboardingTwoTitle {
    return Intl.message(
      'Your Bookish Soulmate Awaits',
      name: 'onboardingTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.`
  String get onboardingTwoDescription {
    return Intl.message(
      'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
      name: 'onboardingTwoDescription',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//OnBoarding Three Screen Strings//' key

  /// `Start Your Adventure`
  String get onboardingThreeTitle {
    return Intl.message(
      'Start Your Adventure',
      name: 'onboardingThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!`
  String get onboardingThreeDescription {
    return Intl.message(
      'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
      name: 'onboardingThreeDescription',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Sign Up Page Strings//' key

  /// `Sign Up`
  String get signUpTitle {
    return Intl.message('Sign Up', name: 'signUpTitle', desc: '', args: []);
  }

  /// `Create account and choose favorite menu`
  String get signUpSubtitle {
    return Intl.message(
      'Create account and choose favorite menu',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message('Name', name: 'nameLabel', desc: '', args: []);
  }

  /// `Your Name`
  String get namePlaceholder {
    return Intl.message(
      'Your Name',
      name: 'namePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters`
  String get nameMinimumLength {
    return Intl.message(
      'Name must be at least 2 characters',
      name: 'nameMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get passwordMinimumLength {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'passwordMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNumberRequired {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one letter`
  String get passwordLetterRequired {
    return Intl.message(
      'Password must contain at least one letter',
      name: 'passwordLetterRequired',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 8 characters`
  String get minimumEightCharacters {
    return Intl.message(
      'Minimum 8 characters',
      name: 'minimumEightCharacters',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number (1-9)`
  String get atLeastOneNumber {
    return Intl.message(
      'At least 1 number (1-9)',
      name: 'atLeastOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least lowercase or uppercase letters`
  String get atLeastOneLetter {
    return Intl.message(
      'At least lowercase or uppercase letters',
      name: 'atLeastOneLetter',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message('Register', name: 'registerButton', desc: '', args: []);
  }

  /// `Have an account?`
  String get haveAccount {
    return Intl.message(
      'Have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `By clicking Register, you agree to our`
  String get registerAgreement {
    return Intl.message(
      'By clicking Register, you agree to our',
      name: 'registerAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Terms, Data Policy.`
  String get termsAndDataPolicy {
    return Intl.message(
      'Terms, Data Policy.',
      name: 'termsAndDataPolicy',
      desc: '',
      args: [],
    );
  }

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

  /// `Phone Number`
  String get phoneNumberFieldLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberFieldLabel',
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
