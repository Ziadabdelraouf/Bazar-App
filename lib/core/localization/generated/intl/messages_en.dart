// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "You have ${count} coupons to use";

  static String m1(discount) => "Discount ${discount}%";

  static String m2(error) => "Failed to resend verification link: ${error}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 item', other: '${count} items')}";

  static String m4(seconds) => "Resend in ${seconds}s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "PasswordChanged": MessageLookupByLibrary.simpleMessage(
      "Password Changed!",
    ),
    "PasswordChangedBody": MessageLookupByLibrary.simpleMessage(
      "Your password changed successfully, you can login again with a new password",
    ),
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "addToCartButton": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "addressNotFound": MessageLookupByLibrary.simpleMessage(
      "Address not found",
    ),
    "addressTitlePlaceholder": MessageLookupByLibrary.simpleMessage(
      "e.g. My Home",
    ),
    "addressTitleRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter an address title",
    ),
    "addressTypeLabel": MessageLookupByLibrary.simpleMessage("Address Type"),
    "addressUnavailable": MessageLookupByLibrary.simpleMessage(
      "Address unavailable",
    ),
    "allCategoryTab": MessageLookupByLibrary.simpleMessage("All"),
    "april": MessageLookupByLibrary.simpleMessage("April"),
    "atLeastOneLetter": MessageLookupByLibrary.simpleMessage(
      "At least lowercase or uppercase letters",
    ),
    "atLeastOneNumber": MessageLookupByLibrary.simpleMessage(
      "At least 1 number (1-9)",
    ),
    "august": MessageLookupByLibrary.simpleMessage("August"),
    "availableCoupons": m0,
    "backToSignInButton": MessageLookupByLibrary.simpleMessage(
      "Back to Sign In",
    ),
    "bestVendorsTitle": MessageLookupByLibrary.simpleMessage("Best Vendors"),
    "betweenTimeSlot": MessageLookupByLibrary.simpleMessage("Between"),
    "booksCategoryTab": MessageLookupByLibrary.simpleMessage("Books"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelledStatus": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "cardHasExpired": MessageLookupByLibrary.simpleMessage("Card has expired"),
    "cardNumberInvalid": MessageLookupByLibrary.simpleMessage(
      "Card number must be 16 digits",
    ),
    "cardNumberLabel": MessageLookupByLibrary.simpleMessage("Card Number"),
    "cardNumberPlaceholder": MessageLookupByLibrary.simpleMessage(
      "1234567890123456",
    ),
    "cardholderNameLabel": MessageLookupByLibrary.simpleMessage(
      "Cardholder Name",
    ),
    "cardholderNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "e.g. Ahmed Mohamed",
    ),
    "cardholderNameRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter cardholder name",
    ),
    "cartTitle": MessageLookupByLibrary.simpleMessage("Cart"),
    "cartTotal": MessageLookupByLibrary.simpleMessage("Total"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage("Cash on Delivery"),
    "categoryTitle": MessageLookupByLibrary.simpleMessage("Category"),
    "changePictureButton": MessageLookupByLibrary.simpleMessage(
      "Change Picture",
    ),
    "changesSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Your changes have been saved successfully",
    ),
    "checkInboxVerificationPrompt": MessageLookupByLibrary.simpleMessage(
      "Check your inbox and click the link inside to confirm your email address.",
    ),
    "checkoutButton": MessageLookupByLibrary.simpleMessage("Checkout"),
    "chooseAddressToCompleteOrder": MessageLookupByLibrary.simpleMessage(
      "Choose your address to complete the order",
    ),
    "codeResentMessage": MessageLookupByLibrary.simpleMessage("Code resent!"),
    "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmChangesMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to save these changes?",
    ),
    "confirmChangesTitle": MessageLookupByLibrary.simpleMessage(
      "Confirm Changes",
    ),
    "confirmOrderAddressHeader": MessageLookupByLibrary.simpleMessage(
      "Address",
    ),
    "confirmOrderButton": MessageLookupByLibrary.simpleMessage("Order"),
    "confirmOrderChangeButton": MessageLookupByLibrary.simpleMessage("Change"),
    "confirmOrderChooseDateTime": MessageLookupByLibrary.simpleMessage(
      "Choose date and time",
    ),
    "confirmOrderChoosePayment": MessageLookupByLibrary.simpleMessage(
      "Choose your payment",
    ),
    "confirmOrderDateTimeHeader": MessageLookupByLibrary.simpleMessage(
      "Date and time",
    ),
    "confirmOrderDateTimeTitle": MessageLookupByLibrary.simpleMessage(
      "Date & time",
    ),
    "confirmOrderPaymentHeader": MessageLookupByLibrary.simpleMessage(
      "Payment",
    ),
    "confirmOrderPaymentTitle": MessageLookupByLibrary.simpleMessage("Payment"),
    "confirmOrderPrice": MessageLookupByLibrary.simpleMessage("Price"),
    "confirmOrderSeeDetails": MessageLookupByLibrary.simpleMessage(
      "See details",
    ),
    "confirmOrderShipping": MessageLookupByLibrary.simpleMessage("Shipping"),
    "confirmOrderSummaryHeader": MessageLookupByLibrary.simpleMessage(
      "Summary",
    ),
    "confirmOrderTitle": MessageLookupByLibrary.simpleMessage("Confirm Order"),
    "confirmOrderTotalPayment": MessageLookupByLibrary.simpleMessage(
      "Total Payment",
    ),
    "confirmPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Please confirm your password",
    ),
    "confirmPaymentMethodButton": MessageLookupByLibrary.simpleMessage(
      "Confirm Payment Method",
    ),
    "confirmationButton": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "congratsVerified": MessageLookupByLibrary.simpleMessage(
      "Congrats, you are verified!",
    ),
    "congratsVerifiedTapBelow": MessageLookupByLibrary.simpleMessage(
      "Congrats, you are verified! Tap below to continue to complete your sign up process.",
    ),
    "congratulations": MessageLookupByLibrary.simpleMessage("Congratulations!"),
    "contactMethodEmailSubtitle": MessageLookupByLibrary.simpleMessage(
      "Send to your email",
    ),
    "contactMethodEmailTitle": MessageLookupByLibrary.simpleMessage("Email"),
    "contactMethodPhoneSubtitle": MessageLookupByLibrary.simpleMessage(
      "Send to your phone",
    ),
    "contactMethodPhoneTitle": MessageLookupByLibrary.simpleMessage(
      "Phone Number",
    ),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueShoppingButton": MessageLookupByLibrary.simpleMessage(
      "Continue shopping",
    ),
    "continueSignUpButton": MessageLookupByLibrary.simpleMessage(
      "Continue Sign Up",
    ),
    "continueSignUpProcess": MessageLookupByLibrary.simpleMessage(
      "Continue to complete your sign up process",
    ),
    "couldNotLoadVendors": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t load vendors",
    ),
    "createNewPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Create your new password, so you can login to your account",
    ),
    "createNewPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "New password",
    ),
    "creditDebitCard": MessageLookupByLibrary.simpleMessage(
      "Credit / Debit Card",
    ),
    "currentLocation": MessageLookupByLibrary.simpleMessage("Current location"),
    "cvvInvalid": MessageLookupByLibrary.simpleMessage("Enter 3 digits"),
    "cvvLabel": MessageLookupByLibrary.simpleMessage("CVV"),
    "cvvPlaceholder": MessageLookupByLibrary.simpleMessage("123"),
    "december": MessageLookupByLibrary.simpleMessage("December"),
    "deliveredStatus": MessageLookupByLibrary.simpleMessage("Delivered"),
    "deliveryDateTitle": MessageLookupByLibrary.simpleMessage("Delivery date"),
    "deliveryTimeTitle": MessageLookupByLibrary.simpleMessage("Delivery time"),
    "detailAddressTitle": MessageLookupByLibrary.simpleMessage(
      "Detail Address",
    ),
    "didNotReceiveLink": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive the link?",
    ),
    "discountPercent": m1,
    "dontHaveAccountText": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "emailExamplePlaceholder": MessageLookupByLibrary.simpleMessage(
      "example@email.com",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailPlaceholder": MessageLookupByLibrary.simpleMessage("Your email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "emptyPhoneNumberError": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "expiryDateFormatInvalid": MessageLookupByLibrary.simpleMessage(
      "Use MM/YY format",
    ),
    "expiryDateLabel": MessageLookupByLibrary.simpleMessage("Expiry Date"),
    "expiryDatePlaceholder": MessageLookupByLibrary.simpleMessage("MM/YY"),
    "expiryDateRequired": MessageLookupByLibrary.simpleMessage("Enter expiry"),
    "failedToLoadCart": MessageLookupByLibrary.simpleMessage(
      "Failed to load cart items",
    ),
    "failedToLoadOffers": MessageLookupByLibrary.simpleMessage(
      "Failed to load offers",
    ),
    "failedToResendVerificationLink": m2,
    "february": MessageLookupByLibrary.simpleMessage("February"),
    "forgotPasswordButton": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "forgotPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Select which contact details should we use to reset your password",
    ),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "fullAddressPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter your full address",
    ),
    "fullAddressRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your full address",
    ),
    "getStartedButton": MessageLookupByLibrary.simpleMessage("Get Started"),
    "haveAccount": MessageLookupByLibrary.simpleMessage("Have an account?"),
    "helpCenter": MessageLookupByLibrary.simpleMessage("Help Center"),
    "helpCenterEmailSubtitle": MessageLookupByLibrary.simpleMessage(
      "Send to your email",
    ),
    "helpCenterEmailTitle": MessageLookupByLibrary.simpleMessage("Email"),
    "helpCenterOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Order History",
    ),
    "helpCenterPhoneSubtitle": MessageLookupByLibrary.simpleMessage(
      "Send to your phone",
    ),
    "helpCenterPhoneTitle": MessageLookupByLibrary.simpleMessage("Phone"),
    "helpCenterSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tell us how we can help 👋\nChapter are standing by for service & support!",
    ),
    "helpCenterTitle": MessageLookupByLibrary.simpleMessage("Help Center"),
    "homeAddress": MessageLookupByLibrary.simpleMessage("Home"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Home"),
    "incorrectCodeError": MessageLookupByLibrary.simpleMessage(
      "Incorrect code, please try again.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("Enter a valid email"),
    "invalidPhoneNumberError": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "itemsCount": m3,
    "january": MessageLookupByLibrary.simpleMessage("January"),
    "july": MessageLookupByLibrary.simpleMessage("July"),
    "june": MessageLookupByLibrary.simpleMessage("June"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "locationTitle": MessageLookupByLibrary.simpleMessage("Location"),
    "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "logoutButton": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "logoutTitle": MessageLookupByLibrary.simpleMessage("Logout"),
    "march": MessageLookupByLibrary.simpleMessage("March"),
    "may": MessageLookupByLibrary.simpleMessage("May"),
    "minimumEightCharacters": MessageLookupByLibrary.simpleMessage(
      "Minimum 8 characters",
    ),
    "myAccount": MessageLookupByLibrary.simpleMessage("My Account"),
    "myAccountTitle": MessageLookupByLibrary.simpleMessage("My Account"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
    "nameMinimumLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "namePlaceholder": MessageLookupByLibrary.simpleMessage("Your Name"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "newPasswordLabel": MessageLookupByLibrary.simpleMessage("New Password"),
    "noFavoritesYet": MessageLookupByLibrary.simpleMessage("No favorites yet"),
    "noOffersAvailable": MessageLookupByLibrary.simpleMessage(
      "No offers available",
    ),
    "noOrdersYet": MessageLookupByLibrary.simpleMessage("No orders yet"),
    "noProductsInCart": MessageLookupByLibrary.simpleMessage(
      "There are no products in the cart",
    ),
    "noVendorsFound": MessageLookupByLibrary.simpleMessage("No vendors found"),
    "november": MessageLookupByLibrary.simpleMessage("November"),
    "october": MessageLookupByLibrary.simpleMessage("October"),
    "offersAndPromos": MessageLookupByLibrary.simpleMessage("Offers & Promos"),
    "officeAddress": MessageLookupByLibrary.simpleMessage("Office"),
    "onboardingOneDescription": MessageLookupByLibrary.simpleMessage(
      " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
    ),
    "onboardingOneTitle": MessageLookupByLibrary.simpleMessage(
      "Now reading books will be easier",
    ),
    "onboardingThreeDescription": MessageLookupByLibrary.simpleMessage(
      "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!",
    ),
    "onboardingThreeTitle": MessageLookupByLibrary.simpleMessage(
      "Start Your Adventure",
    ),
    "onboardingTwoDescription": MessageLookupByLibrary.simpleMessage(
      "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
    ),
    "onboardingTwoTitle": MessageLookupByLibrary.simpleMessage(
      "Your Bookish Soulmate Awaits",
    ),
    "orSeparator": MessageLookupByLibrary.simpleMessage("or"),
    "orderHistory": MessageLookupByLibrary.simpleMessage("Order History"),
    "orderHistoryPageTitle": MessageLookupByLibrary.simpleMessage(
      "Order History",
    ),
    "orderNowButton": MessageLookupByLibrary.simpleMessage("Order Now"),
    "orderPlacedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Order placed successfully!",
    ),
    "ourVendorsSubtitle": MessageLookupByLibrary.simpleMessage("Our Vendors"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLetterRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one letter",
    ),
    "passwordMinimumLength": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least 8 characters",
    ),
    "passwordNumberRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number",
    ),
    "passwordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Your password",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paySecurelyWithCard": MessageLookupByLibrary.simpleMessage(
      "Pay securely with your card",
    ),
    "payWithCashUponDelivery": MessageLookupByLibrary.simpleMessage(
      "Pay with cash upon delivery",
    ),
    "payWithCashWhenOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Pay with cash when your order arrives",
    ),
    "paymentDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Payment Details",
    ),
    "phoneExamplePlaceholder": MessageLookupByLibrary.simpleMessage(
      "(+965) 123 435 7565",
    ),
    "phoneNumberDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number, so we can more easily deliver your order",
    ),
    "phoneNumberFieldLabel": MessageLookupByLibrary.simpleMessage(
      "Phone Number",
    ),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberPlaceholder": MessageLookupByLibrary.simpleMessage(
      "your phone number",
    ),
    "phoneNumberTitle": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pickDateSubtitle": MessageLookupByLibrary.simpleMessage("a date"),
    "pickDateTitle": MessageLookupByLibrary.simpleMessage("Pick"),
    "pleaseSelectDeliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Please select a delivery address.",
    ),
    "pleaseSelectDeliveryDateTime": MessageLookupByLibrary.simpleMessage(
      "Please select a delivery date and time.",
    ),
    "pleaseSelectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Please select and complete a payment method.",
    ),
    "pleaseVerifyAccount": MessageLookupByLibrary.simpleMessage(
      "Please verify your account",
    ),
    "pleaseVerifyEmail": MessageLookupByLibrary.simpleMessage(
      "Please verify your email",
    ),
    "poemsCategoryTab": MessageLookupByLibrary.simpleMessage("Poems"),
    "productDescriptionPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
    ),
    "products": MessageLookupByLibrary.simpleMessage("Products"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "registerAgreement": MessageLookupByLibrary.simpleMessage(
      "By clicking Register, you agree to our",
    ),
    "registerButton": MessageLookupByLibrary.simpleMessage("Register"),
    "removeButton": MessageLookupByLibrary.simpleMessage("Remove"),
    "removeFromFavoritesConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this book from your favorites?",
    ),
    "removeFromFavoritesTitle": MessageLookupByLibrary.simpleMessage(
      "Remove from Favorites?",
    ),
    "resendButton": MessageLookupByLibrary.simpleMessage("Resend"),
    "resendCodePrompt": MessageLookupByLibrary.simpleMessage(
      "If you didn\'t receive a code? ",
    ),
    "resendInSeconds": m4,
    "resendLink": MessageLookupByLibrary.simpleMessage("Resend link"),
    "resending": MessageLookupByLibrary.simpleMessage("Resending..."),
    "resetLinkSentDescription": MessageLookupByLibrary.simpleMessage(
      "A password reset link has been sent to your account. Please check your email inbox and spam folder.",
    ),
    "resetLinkSentTitle": MessageLookupByLibrary.simpleMessage(
      "Password Reset Link Sent",
    ),
    "resetPasswordEmailDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter your email, we will send verification code to your email.",
    ),
    "resetPasswordPhoneDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number, we will send a verification code to your phone number.",
    ),
    "resetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Reset password",
    ),
    "retryButton": MessageLookupByLibrary.simpleMessage("Retry"),
    "reviewLabel": MessageLookupByLibrary.simpleMessage("Review"),
    "saveAddressAs": MessageLookupByLibrary.simpleMessage("Save Address As"),
    "saveAddressButton": MessageLookupByLibrary.simpleMessage("Save Address"),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "searchCountryHint": MessageLookupByLibrary.simpleMessage(
      "Search country or code",
    ),
    "seeAllButton": MessageLookupByLibrary.simpleMessage("See all"),
    "selectAddressMessage": MessageLookupByLibrary.simpleMessage(
      "Select an address on the map",
    ),
    "selectAnAddress": MessageLookupByLibrary.simpleMessage(
      "Select an Address",
    ),
    "selectCountryTitle": MessageLookupByLibrary.simpleMessage(
      "Select Country",
    ),
    "selectPaymentMethodTitle": MessageLookupByLibrary.simpleMessage(
      "Select Payment Method",
    ),
    "selectedAddressTitle": MessageLookupByLibrary.simpleMessage(
      "Selected Address",
    ),
    "sendButton": MessageLookupByLibrary.simpleMessage("Send"),
    "september": MessageLookupByLibrary.simpleMessage("September"),
    "signInButton": MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInSubtitle": MessageLookupByLibrary.simpleMessage(
      "Sign in to your account",
    ),
    "signInWithAppleButton": MessageLookupByLibrary.simpleMessage(
      "Sign in with Apple",
    ),
    "signInWithGoogleButton": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "signUpButton": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpEmailPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Your Email",
    ),
    "signUpPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Your Password",
    ),
    "signUpSubtitle": MessageLookupByLibrary.simpleMessage(
      "Create account and choose favorite menu",
    ),
    "signUpTitle": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "skipButton": MessageLookupByLibrary.simpleMessage("Skip"),
    "specialForYouCategoryTab": MessageLookupByLibrary.simpleMessage(
      "Special for You",
    ),
    "stationeryCategoryTab": MessageLookupByLibrary.simpleMessage("Stationery"),
    "successBody": MessageLookupByLibrary.simpleMessage(
      "your account is complete, Please enjoy the best menu from us.",
    ),
    "termsAndDataPolicy": MessageLookupByLibrary.simpleMessage(
      "Terms, Data Policy.",
    ),
    "timeSlot10AM1PM": MessageLookupByLibrary.simpleMessage("10AM : 1PM"),
    "timeSlot1PM4PM": MessageLookupByLibrary.simpleMessage("1PM : 4PM"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "tomorrow": MessageLookupByLibrary.simpleMessage("Tomorrow"),
    "topOfWeekTitle": MessageLookupByLibrary.simpleMessage("Top of Week"),
    "vendorsPageTitle": MessageLookupByLibrary.simpleMessage("Vendors"),
    "verificationCodeTitle": MessageLookupByLibrary.simpleMessage(
      "Verification Code",
    ),
    "verificationComplete": MessageLookupByLibrary.simpleMessage(
      "Verification Complete!",
    ),
    "verificationEmailTitle": MessageLookupByLibrary.simpleMessage(
      "Verification Email",
    ),
    "verificationLinkSentAgain": MessageLookupByLibrary.simpleMessage(
      "Verification link sent again. Please check your inbox.",
    ),
    "verificationLinkSentTo": MessageLookupByLibrary.simpleMessage(
      "We sent a verification link to\n",
    ),
    "verificationPhoneTitle": MessageLookupByLibrary.simpleMessage(
      "Verification Phone",
    ),
    "verificationSentToEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter the code we just sent to email ",
    ),
    "verificationSentToPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter the code we just sent to phone number ",
    ),
    "viewCartButton": MessageLookupByLibrary.simpleMessage("View cart"),
    "welcomeBackTitle": MessageLookupByLibrary.simpleMessage("Welcome Back "),
    "yourFavoritesTitle": MessageLookupByLibrary.simpleMessage(
      "Your Favorites",
    ),
    "yourFavourites": MessageLookupByLibrary.simpleMessage("Your Favourites"),
  };
}
