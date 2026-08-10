import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_text_styles_extension.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/localization/locale_notifier.dart';

class LanguageToggleTile extends ConsumerWidget {
  const LanguageToggleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(localeNotifierProvider);
    final currentLocale = localeAsync.value ?? const Locale('en');
    final isArabic = currentLocale.languageCode == 'ar';
    final colorScheme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).extension<AppTextStylesExtension>()!;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: colorScheme.primaryContainer,
        child: Icon(
          Icons.language,
          color: colorScheme.primary,
        ),
      ),
      title: Text(
        S.of(context).language,
        style: textStyles.body16Medium,
      ),
      trailing: SegmentedButton<String>(
        segments: const [
          ButtonSegment(value: 'en', label: Text('EN')),
          ButtonSegment(value: 'ar', label: Text('AR')),
        ],
        selected: {isArabic ? 'ar' : 'en'},
        onSelectionChanged: (Set<String> selection) {
          ref.read(localeNotifierProvider.notifier).toggleLocale();
        },
        showSelectedIcon: false,
      ),
    );
  }
}