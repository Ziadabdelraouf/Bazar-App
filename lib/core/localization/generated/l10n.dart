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

  /// `Add to Cart`
  String get addToCartButton {
    return Intl.message(
      'Add to Cart',
      name: 'addToCartButton',
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

  /// `Your email`
  String get emailPlaceholder {
    return Intl.message(
      'Your email',
      name: 'emailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Your password`
  String get passwordPlaceholder {
    return Intl.message(
      'Your password',
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

  /// `Your Email`
  String get signUpEmailPlaceholder {
    return Intl.message(
      'Your Email',
      name: 'signUpEmailPlaceholder',
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

  /// `Your Password`
  String get signUpPasswordPlaceholder {
    return Intl.message(
      'Your Password',
      name: 'signUpPasswordPlaceholder',
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

  /// `Verification link sent again. Please check your inbox.`
  String get verificationLinkSentAgain {
    return Intl.message(
      'Verification link sent again. Please check your inbox.',
      name: 'verificationLinkSentAgain',
      desc: '',
      args: [],
    );
  }

  /// `Failed to resend verification link: {error}`
  String failedToResendVerificationLink(Object error) {
    return Intl.message(
      'Failed to resend verification link: $error',
      name: 'failedToResendVerificationLink',
      desc: '',
      args: [error],
    );
  }

  /// `Congrats, you are verified!`
  String get congratsVerified {
    return Intl.message(
      'Congrats, you are verified!',
      name: 'congratsVerified',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email`
  String get pleaseVerifyEmail {
    return Intl.message(
      'Please verify your email',
      name: 'pleaseVerifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue to complete your sign up process`
  String get continueSignUpProcess {
    return Intl.message(
      'Continue to complete your sign up process',
      name: 'continueSignUpProcess',
      desc: '',
      args: [],
    );
  }

  /// `We sent a verification link to\n`
  String get verificationLinkSentTo {
    return Intl.message(
      'We sent a verification link to\n',
      name: 'verificationLinkSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your account`
  String get pleaseVerifyAccount {
    return Intl.message(
      'Please verify your account',
      name: 'pleaseVerifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox and click the link inside to confirm your email address.`
  String get checkInboxVerificationPrompt {
    return Intl.message(
      'Check your inbox and click the link inside to confirm your email address.',
      name: 'checkInboxVerificationPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the link?`
  String get didNotReceiveLink {
    return Intl.message(
      'Didn\'t receive the link?',
      name: 'didNotReceiveLink',
      desc: '',
      args: [],
    );
  }

  /// `Resending...`
  String get resending {
    return Intl.message('Resending...', name: 'resending', desc: '', args: []);
  }

  /// `Resend in {seconds}s`
  String resendInSeconds(Object seconds) {
    return Intl.message(
      'Resend in ${seconds}s',
      name: 'resendInSeconds',
      desc: '',
      args: [seconds],
    );
  }

  /// `Resend link`
  String get resendLink {
    return Intl.message('Resend link', name: 'resendLink', desc: '', args: []);
  }

  /// `Verification Complete!`
  String get verificationComplete {
    return Intl.message(
      'Verification Complete!',
      name: 'verificationComplete',
      desc: '',
      args: [],
    );
  }

  /// `Congrats, you are verified! Tap below to continue to complete your sign up process.`
  String get congratsVerifiedTapBelow {
    return Intl.message(
      'Congrats, you are verified! Tap below to continue to complete your sign up process.',
      name: 'congratsVerifiedTapBelow',
      desc: '',
      args: [],
    );
  }

  /// `Continue Sign Up`
  String get continueSignUpButton {
    return Intl.message(
      'Continue Sign Up',
      name: 'continueSignUpButton',
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

  // skipped getter for the '//Forgot Password Screen Strings//' key

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select which contact details should we use to reset your password`
  String get forgotPasswordDescription {
    return Intl.message(
      'Select which contact details should we use to reset your password',
      name: 'forgotPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contactMethodEmailTitle {
    return Intl.message(
      'Email',
      name: 'contactMethodEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send to your email`
  String get contactMethodEmailSubtitle {
    return Intl.message(
      'Send to your email',
      name: 'contactMethodEmailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get contactMethodPhoneTitle {
    return Intl.message(
      'Phone Number',
      name: 'contactMethodPhoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send to your phone`
  String get contactMethodPhoneSubtitle {
    return Intl.message(
      'Send to your phone',
      name: 'contactMethodPhoneSubtitle',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Reset Password Screen Strings//' key

  /// `Reset password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email, we will send verification code to your email.`
  String get resetPasswordEmailDescription {
    return Intl.message(
      'Please enter your email, we will send verification code to your email.',
      name: 'resetPasswordEmailDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number, we will send a verification code to your phone number.`
  String get resetPasswordPhoneDescription {
    return Intl.message(
      'Please enter your phone number, we will send a verification code to your phone number.',
      name: 'resetPasswordPhoneDescription',
      desc: '',
      args: [],
    );
  }

  /// `example@email.com`
  String get emailExamplePlaceholder {
    return Intl.message(
      'example@email.com',
      name: 'emailExamplePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `(+965) 123 435 7565`
  String get phoneExamplePlaceholder {
    return Intl.message(
      '(+965) 123 435 7565',
      name: 'phoneExamplePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendButton {
    return Intl.message('Send', name: 'sendButton', desc: '', args: []);
  }

  /// `Password Reset Link Sent`
  String get resetLinkSentTitle {
    return Intl.message(
      'Password Reset Link Sent',
      name: 'resetLinkSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `A password reset link has been sent to your account. Please check your email inbox and spam folder.`
  String get resetLinkSentDescription {
    return Intl.message(
      'A password reset link has been sent to your account. Please check your email inbox and spam folder.',
      name: 'resetLinkSentDescription',
      desc: '',
      args: [],
    );
  }

  /// `Back to Sign In`
  String get backToSignInButton {
    return Intl.message(
      'Back to Sign In',
      name: 'backToSignInButton',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Create New Password Screen Strings//' key

  /// `New password`
  String get createNewPasswordTitle {
    return Intl.message(
      'New password',
      name: 'createNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create your new password, so you can login to your account`
  String get createNewPasswordDescription {
    return Intl.message(
      'Create your new password, so you can login to your account',
      name: 'createNewPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Home Page Strings//' key

  /// `Home`
  String get homeTitle {
    return Intl.message('Home', name: 'homeTitle', desc: '', args: []);
  }

  /// `Category`
  String get categoryTitle {
    return Intl.message('Category', name: 'categoryTitle', desc: '', args: []);
  }

  /// `Cart`
  String get cartTitle {
    return Intl.message('Cart', name: 'cartTitle', desc: '', args: []);
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message('Profile', name: 'profileTitle', desc: '', args: []);
  }

  // skipped getter for the '//Profile Strings//' key

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Offers & Promos`
  String get offersAndPromos {
    return Intl.message(
      'Offers & Promos',
      name: 'offersAndPromos',
      desc: '',
      args: [],
    );
  }

  /// `Your Favourites`
  String get yourFavourites {
    return Intl.message(
      'Your Favourites',
      name: 'yourFavourites',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message('Help Center', name: 'helpCenter', desc: '', args: []);
  }

  // skipped getter for the '//Special Offer Strings//' key

  /// `No offers available`
  String get noOffersAvailable {
    return Intl.message(
      'No offers available',
      name: 'noOffersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Discount {discount}%`
  String discountPercent(Object discount) {
    return Intl.message(
      'Discount $discount%',
      name: 'discountPercent',
      desc: '',
      args: [discount],
    );
  }

  /// `Order Now`
  String get orderNowButton {
    return Intl.message(
      'Order Now',
      name: 'orderNowButton',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load offers`
  String get failedToLoadOffers {
    return Intl.message(
      'Failed to load offers',
      name: 'failedToLoadOffers',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryButton {
    return Intl.message('Retry', name: 'retryButton', desc: '', args: []);
  }

  // skipped getter for the '//Author Detail Strings//' key

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  // skipped getter for the '//Detail Menu Screen Strings//' key

  /// `Review`
  String get reviewLabel {
    return Intl.message('Review', name: 'reviewLabel', desc: '', args: []);
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.`
  String get productDescriptionPlaceholder {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.',
      name: 'productDescriptionPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Continue shopping`
  String get continueShoppingButton {
    return Intl.message(
      'Continue shopping',
      name: 'continueShoppingButton',
      desc: '',
      args: [],
    );
  }

  /// `View cart`
  String get viewCartButton {
    return Intl.message(
      'View cart',
      name: 'viewCartButton',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Cart Screen Strings//' key

  /// `Failed to load cart items`
  String get failedToLoadCart {
    return Intl.message(
      'Failed to load cart items',
      name: 'failedToLoadCart',
      desc: '',
      args: [],
    );
  }

  /// `There are no products in the cart`
  String get noProductsInCart {
    return Intl.message(
      'There are no products in the cart',
      name: 'noProductsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get cartTotal {
    return Intl.message('Total', name: 'cartTotal', desc: '', args: []);
  }

  /// `Checkout`
  String get checkoutButton {
    return Intl.message('Checkout', name: 'checkoutButton', desc: '', args: []);
  }

  // skipped getter for the '//Best Vendors Widget Strings//' key

  /// `Best Vendors`
  String get bestVendorsTitle {
    return Intl.message(
      'Best Vendors',
      name: 'bestVendorsTitle',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAllButton {
    return Intl.message('See all', name: 'seeAllButton', desc: '', args: []);
  }

  /// `Couldn't load vendors`
  String get couldNotLoadVendors {
    return Intl.message(
      'Couldn\'t load vendors',
      name: 'couldNotLoadVendors',
      desc: '',
      args: [],
    );
  }

  /// `No vendors found`
  String get noVendorsFound {
    return Intl.message(
      'No vendors found',
      name: 'noVendorsFound',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Vendors Page Strings//' key

  /// `Our Vendors`
  String get ourVendorsSubtitle {
    return Intl.message(
      'Our Vendors',
      name: 'ourVendorsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Vendors`
  String get vendorsPageTitle {
    return Intl.message(
      'Vendors',
      name: 'vendorsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allCategoryTab {
    return Intl.message('All', name: 'allCategoryTab', desc: '', args: []);
  }

  /// `Books`
  String get booksCategoryTab {
    return Intl.message('Books', name: 'booksCategoryTab', desc: '', args: []);
  }

  /// `Poems`
  String get poemsCategoryTab {
    return Intl.message('Poems', name: 'poemsCategoryTab', desc: '', args: []);
  }

  /// `Special for You`
  String get specialForYouCategoryTab {
    return Intl.message(
      'Special for You',
      name: 'specialForYouCategoryTab',
      desc: '',
      args: [],
    );
  }

  /// `Stationery`
  String get stationeryCategoryTab {
    return Intl.message(
      'Stationery',
      name: 'stationeryCategoryTab',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Favorites Page Strings//' key

  /// `Your Favorites`
  String get yourFavoritesTitle {
    return Intl.message(
      'Your Favorites',
      name: 'yourFavoritesTitle',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get noFavoritesYet {
    return Intl.message(
      'No favorites yet',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `Remove from Favorites?`
  String get removeFromFavoritesTitle {
    return Intl.message(
      'Remove from Favorites?',
      name: 'removeFromFavoritesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this book from your favorites?`
  String get removeFromFavoritesConfirmation {
    return Intl.message(
      'Are you sure you want to remove this book from your favorites?',
      name: 'removeFromFavoritesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get removeButton {
    return Intl.message('Remove', name: 'removeButton', desc: '', args: []);
  }

  // skipped getter for the '//Logout Bottom Sheet Strings//' key

  /// `Logout`
  String get logoutTitle {
    return Intl.message('Logout', name: 'logoutTitle', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmationMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutButton {
    return Intl.message('Logout', name: 'logoutButton', desc: '', args: []);
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message('Cancel', name: 'cancelButton', desc: '', args: []);
  }

  /// `My Account`
  String get myAccountTitle {
    return Intl.message(
      'My Account',
      name: 'myAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `your phone number`
  String get phoneNumberPlaceholder {
    return Intl.message(
      'your phone number',
      name: 'phoneNumberPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChangesButton {
    return Intl.message(
      'Save Changes',
      name: 'saveChangesButton',
      desc: '',
      args: [],
    );
  }

  /// `Change Picture`
  String get changePictureButton {
    return Intl.message(
      'Change Picture',
      name: 'changePictureButton',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '//Order History Page Strings//' key

  /// `Order History`
  String get orderHistoryPageTitle {
    return Intl.message(
      'Order History',
      name: 'orderHistoryPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get noOrdersYet {
    return Intl.message(
      'No orders yet',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get deliveredStatus {
    return Intl.message(
      'Delivered',
      name: 'deliveredStatus',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelledStatus {
    return Intl.message(
      'Cancelled',
      name: 'cancelledStatus',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 item} other{{count} items}}`
  String itemsCount(int count) {
    return Intl.plural(
      count,
      one: '1 item',
      other: '$count items',
      name: 'itemsCount',
      desc: '',
      args: [count],
    );
  }

  /// `January`
  String get january {
    return Intl.message('January', name: 'january', desc: '', args: []);
  }

  /// `February`
  String get february {
    return Intl.message('February', name: 'february', desc: '', args: []);
  }

  /// `March`
  String get march {
    return Intl.message('March', name: 'march', desc: '', args: []);
  }

  /// `April`
  String get april {
    return Intl.message('April', name: 'april', desc: '', args: []);
  }

  /// `May`
  String get may {
    return Intl.message('May', name: 'may', desc: '', args: []);
  }

  /// `June`
  String get june {
    return Intl.message('June', name: 'june', desc: '', args: []);
  }

  /// `July`
  String get july {
    return Intl.message('July', name: 'july', desc: '', args: []);
  }

  /// `August`
  String get august {
    return Intl.message('August', name: 'august', desc: '', args: []);
  }

  /// `September`
  String get september {
    return Intl.message('September', name: 'september', desc: '', args: []);
  }

  /// `October`
  String get october {
    return Intl.message('October', name: 'october', desc: '', args: []);
  }

  /// `November`
  String get november {
    return Intl.message('November', name: 'november', desc: '', args: []);
  }

  /// `December`
  String get december {
    return Intl.message('December', name: 'december', desc: '', args: []);
  }

  /// `Order History`
  String get helpCenterOrderHistory {
    return Intl.message(
      'Order History',
      name: 'helpCenterOrderHistory',
      desc: 'App bar title on the help center page',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenterTitle {
    return Intl.message(
      'Help Center',
      name: 'helpCenterTitle',
      desc: 'Main heading on the help center page',
      args: [],
    );
  }

  /// `Tell us how we can help 👋\nChapter are standing by for service & support!`
  String get helpCenterSubtitle {
    return Intl.message(
      'Tell us how we can help 👋\nChapter are standing by for service & support!',
      name: 'helpCenterSubtitle',
      desc: 'Subtitle text below the help center heading',
      args: [],
    );
  }

  /// `Email`
  String get helpCenterEmailTitle {
    return Intl.message(
      'Email',
      name: 'helpCenterEmailTitle',
      desc: 'Title of the email contact card',
      args: [],
    );
  }

  /// `Send to your email`
  String get helpCenterEmailSubtitle {
    return Intl.message(
      'Send to your email',
      name: 'helpCenterEmailSubtitle',
      desc: 'Subtitle of the email contact card',
      args: [],
    );
  }

  /// `Phone`
  String get helpCenterPhoneTitle {
    return Intl.message(
      'Phone',
      name: 'helpCenterPhoneTitle',
      desc: 'Title of the phone contact card',
      args: [],
    );
  }

  /// `Send to your phone`
  String get helpCenterPhoneSubtitle {
    return Intl.message(
      'Send to your phone',
      name: 'helpCenterPhoneSubtitle',
      desc: 'Subtitle of the phone contact card',
      args: [],
    );
  }

  /// `Location`
  String get locationTitle {
    return Intl.message(
      'Location',
      name: 'locationTitle',
      desc: 'App bar title on the location/address page',
      args: [],
    );
  }

  /// `Detail Address`
  String get detailAddressTitle {
    return Intl.message(
      'Detail Address',
      name: 'detailAddressTitle',
      desc: 'Heading for the address details section',
      args: [],
    );
  }

  /// `Current location`
  String get currentLocation {
    return Intl.message(
      'Current location',
      name: 'currentLocation',
      desc: 'Tooltip for the current-location icon button',
      args: [],
    );
  }

  /// `Selected Address`
  String get selectedAddressTitle {
    return Intl.message(
      'Selected Address',
      name: 'selectedAddressTitle',
      desc: 'Fallback title shown when no address title is set yet',
      args: [],
    );
  }

  /// `Select an address on the map`
  String get selectAddressMessage {
    return Intl.message(
      'Select an address on the map',
      name: 'selectAddressMessage',
      desc: 'Fallback message prompting the user to pick a location',
      args: [],
    );
  }

  /// `Address not found`
  String get addressNotFound {
    return Intl.message(
      'Address not found',
      name: 'addressNotFound',
      desc: 'Error shown when the selected location has no matching address',
      args: [],
    );
  }

  /// `Address unavailable`
  String get addressUnavailable {
    return Intl.message(
      'Address unavailable',
      name: 'addressUnavailable',
      desc: 'Error shown when the address lookup fails or is unavailable',
      args: [],
    );
  }

  /// `Save Address As`
  String get saveAddressAs {
    return Intl.message(
      'Save Address As',
      name: 'saveAddressAs',
      desc: 'Label above the address type choice chips',
      args: [],
    );
  }

  /// `Home`
  String get homeAddress {
    return Intl.message(
      'Home',
      name: 'homeAddress',
      desc: 'Choice chip label for saving address as Home',
      args: [],
    );
  }

  /// `Office`
  String get officeAddress {
    return Intl.message(
      'Office',
      name: 'officeAddress',
      desc: 'Choice chip label for saving address as Office',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmationButton {
    return Intl.message(
      'Confirmation',
      name: 'confirmationButton',
      desc: 'Button to confirm the selected address',
      args: [],
    );
  }

  /// `You have {count} coupons to use`
  String availableCoupons(int count) {
    return Intl.message(
      'You have $count coupons to use',
      name: 'availableCoupons',
      desc: '',
      args: [count],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Confirm Order`
  String get confirmOrderTitle {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get confirmOrderAddressHeader {
    return Intl.message(
      'Address',
      name: 'confirmOrderAddressHeader',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get confirmOrderChangeButton {
    return Intl.message(
      'Change',
      name: 'confirmOrderChangeButton',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get confirmOrderSummaryHeader {
    return Intl.message(
      'Summary',
      name: 'confirmOrderSummaryHeader',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get confirmOrderPrice {
    return Intl.message('Price', name: 'confirmOrderPrice', desc: '', args: []);
  }

  /// `Shipping`
  String get confirmOrderShipping {
    return Intl.message(
      'Shipping',
      name: 'confirmOrderShipping',
      desc: '',
      args: [],
    );
  }

  /// `Total Payment`
  String get confirmOrderTotalPayment {
    return Intl.message(
      'Total Payment',
      name: 'confirmOrderTotalPayment',
      desc: '',
      args: [],
    );
  }

  /// `See details`
  String get confirmOrderSeeDetails {
    return Intl.message(
      'See details',
      name: 'confirmOrderSeeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Date and time`
  String get confirmOrderDateTimeHeader {
    return Intl.message(
      'Date and time',
      name: 'confirmOrderDateTimeHeader',
      desc: '',
      args: [],
    );
  }

  /// `Date & time`
  String get confirmOrderDateTimeTitle {
    return Intl.message(
      'Date & time',
      name: 'confirmOrderDateTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose date and time`
  String get confirmOrderChooseDateTime {
    return Intl.message(
      'Choose date and time',
      name: 'confirmOrderChooseDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get confirmOrderPaymentHeader {
    return Intl.message(
      'Payment',
      name: 'confirmOrderPaymentHeader',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get confirmOrderPaymentTitle {
    return Intl.message(
      'Payment',
      name: 'confirmOrderPaymentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose your payment`
  String get confirmOrderChoosePayment {
    return Intl.message(
      'Choose your payment',
      name: 'confirmOrderChoosePayment',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get confirmOrderButton {
    return Intl.message(
      'Order',
      name: 'confirmOrderButton',
      desc: '',
      args: [],
    );
  }

  /// `Please select a delivery address.`
  String get pleaseSelectDeliveryAddress {
    return Intl.message(
      'Please select a delivery address.',
      name: 'pleaseSelectDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please select a delivery date and time.`
  String get pleaseSelectDeliveryDateTime {
    return Intl.message(
      'Please select a delivery date and time.',
      name: 'pleaseSelectDeliveryDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Please select and complete a payment method.`
  String get pleaseSelectPaymentMethod {
    return Intl.message(
      'Please select and complete a payment method.',
      name: 'pleaseSelectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully!`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order placed successfully!',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Select an Address`
  String get selectAnAddress {
    return Intl.message(
      'Select an Address',
      name: 'selectAnAddress',
      desc: '',
      args: [],
    );
  }

  /// `Choose your address to complete the order`
  String get chooseAddressToCompleteOrder {
    return Intl.message(
      'Choose your address to complete the order',
      name: 'chooseAddressToCompleteOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pay with cash upon delivery`
  String get payWithCashUponDelivery {
    return Intl.message(
      'Pay with cash upon delivery',
      name: 'payWithCashUponDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit / Debit Card`
  String get creditDebitCard {
    return Intl.message(
      'Credit / Debit Card',
      name: 'creditDebitCard',
      desc: '',
      args: [],
    );
  }

  /// `Delivery date`
  String get deliveryDateTitle {
    return Intl.message(
      'Delivery date',
      name: 'deliveryDateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message('Tomorrow', name: 'tomorrow', desc: '', args: []);
  }

  /// `Pick`
  String get pickDateTitle {
    return Intl.message('Pick', name: 'pickDateTitle', desc: '', args: []);
  }

  /// `a date`
  String get pickDateSubtitle {
    return Intl.message('a date', name: 'pickDateSubtitle', desc: '', args: []);
  }

  /// `Delivery time`
  String get deliveryTimeTitle {
    return Intl.message(
      'Delivery time',
      name: 'deliveryTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Between`
  String get betweenTimeSlot {
    return Intl.message('Between', name: 'betweenTimeSlot', desc: '', args: []);
  }

  /// `10AM : 1PM`
  String get timeSlot10AM1PM {
    return Intl.message(
      '10AM : 1PM',
      name: 'timeSlot10AM1PM',
      desc: '',
      args: [],
    );
  }

  /// `1PM : 4PM`
  String get timeSlot1PM4PM {
    return Intl.message(
      '1PM : 4PM',
      name: 'timeSlot1PM4PM',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Payment Details`
  String get paymentDetailsTitle {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get selectPaymentMethodTitle {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pay with cash when your order arrives`
  String get payWithCashWhenOrderArrives {
    return Intl.message(
      'Pay with cash when your order arrives',
      name: 'payWithCashWhenOrderArrives',
      desc: '',
      args: [],
    );
  }

  /// `Pay securely with your card`
  String get paySecurelyWithCard {
    return Intl.message(
      'Pay securely with your card',
      name: 'paySecurelyWithCard',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardholderNameLabel {
    return Intl.message(
      'Cardholder Name',
      name: 'cardholderNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Ahmed Mohamed`
  String get cardholderNamePlaceholder {
    return Intl.message(
      'e.g. Ahmed Mohamed',
      name: 'cardholderNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter cardholder name`
  String get cardholderNameRequired {
    return Intl.message(
      'Please enter cardholder name',
      name: 'cardholderNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumberLabel {
    return Intl.message(
      'Card Number',
      name: 'cardNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `1234567890123456`
  String get cardNumberPlaceholder {
    return Intl.message(
      '1234567890123456',
      name: 'cardNumberPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Card number must be 16 digits`
  String get cardNumberInvalid {
    return Intl.message(
      'Card number must be 16 digits',
      name: 'cardNumberInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDateLabel {
    return Intl.message(
      'Expiry Date',
      name: 'expiryDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get expiryDatePlaceholder {
    return Intl.message(
      'MM/YY',
      name: 'expiryDatePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter expiry`
  String get expiryDateRequired {
    return Intl.message(
      'Enter expiry',
      name: 'expiryDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Use MM/YY format`
  String get expiryDateFormatInvalid {
    return Intl.message(
      'Use MM/YY format',
      name: 'expiryDateFormatInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Card has expired`
  String get cardHasExpired {
    return Intl.message(
      'Card has expired',
      name: 'cardHasExpired',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvvLabel {
    return Intl.message('CVV', name: 'cvvLabel', desc: '', args: []);
  }

  /// `123`
  String get cvvPlaceholder {
    return Intl.message('123', name: 'cvvPlaceholder', desc: '', args: []);
  }

  /// `Enter 3 digits`
  String get cvvInvalid {
    return Intl.message(
      'Enter 3 digits',
      name: 'cvvInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment Method`
  String get confirmPaymentMethodButton {
    return Intl.message(
      'Confirm Payment Method',
      name: 'confirmPaymentMethodButton',
      desc: '',
      args: [],
    );
  }

  /// `e.g. My Home`
  String get addressTitlePlaceholder {
    return Intl.message(
      'e.g. My Home',
      name: 'addressTitlePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an address title`
  String get addressTitleRequired {
    return Intl.message(
      'Please enter an address title',
      name: 'addressTitleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full address`
  String get fullAddressPlaceholder {
    return Intl.message(
      'Enter your full address',
      name: 'fullAddressPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full address`
  String get fullAddressRequired {
    return Intl.message(
      'Please enter your full address',
      name: 'fullAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Address Type`
  String get addressTypeLabel {
    return Intl.message(
      'Address Type',
      name: 'addressTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get saveAddressButton {
    return Intl.message(
      'Save Address',
      name: 'saveAddressButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Changes`
  String get confirmChangesTitle {
    return Intl.message(
      'Confirm Changes',
      name: 'confirmChangesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to save these changes?`
  String get confirmChangesMessage {
    return Intl.message(
      'Are you sure you want to save these changes?',
      name: 'confirmChangesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your changes have been saved successfully`
  String get changesSavedSuccess {
    return Intl.message(
      'Your changes have been saved successfully',
      name: 'changesSavedSuccess',
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
