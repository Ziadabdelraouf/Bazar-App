import 'package:bazar_group_1/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeToggleTile extends ConsumerWidget {
  const DarkModeToggleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      leading: Icon(
        isDark ? Icons.dark_mode : Icons.light_mode,
        color: primaryColor,
      ),
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: isDark,
        activeColor: primaryColor,
        onChanged: (_) {
          ref.read(themeNotifierProvider.notifier).toggleTheme();
        },
      ),
    );
  }
}
