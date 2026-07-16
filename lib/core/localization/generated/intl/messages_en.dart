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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "PasswordChanged":
            MessageLookupByLibrary.simpleMessage("Password Changed!"),
        "PasswordChangedBody": MessageLookupByLibrary.simpleMessage(
            "Your password changed successfully, you can login again with a new password"),
        "congratulations":
            MessageLookupByLibrary.simpleMessage("Congratulations!"),
        "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
        "getStartedButton": MessageLookupByLibrary.simpleMessage("Get Started"),
        "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "onboardingOneDescription": MessageLookupByLibrary.simpleMessage(
            " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."),
        "onboardingOneTitle": MessageLookupByLibrary.simpleMessage(
            "Now reading books will be easier"),
        "signInButton": MessageLookupByLibrary.simpleMessage("Sign in"),
        "skipButton": MessageLookupByLibrary.simpleMessage("Skip"),
        "successBody": MessageLookupByLibrary.simpleMessage(
            "your account is complete, Please enjoy the best menu from us.")
      };
}
