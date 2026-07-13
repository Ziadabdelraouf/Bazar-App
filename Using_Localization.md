to use the localization in the project:

-Import this line in the file where you want to use the localization:
   import 'package:bazar_group_1/generated/l10n.dart';

- When adding texts go to lib/l10n/ and use intl_en.arb for english and intl_ar.arb for arabic.

- Add the new text to both files in the same format (camelCase) just like the example in the file 

- Use the seperators "//Button Strings//" for better readability .

- Use this line to get the localization in the file:
   S.of(context).<the new key of the text you added>

- To test the changes just change the locale variable in the main.dart file.

- Restart the app to see the changes.
