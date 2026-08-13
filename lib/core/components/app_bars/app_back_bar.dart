import 'package:flutter/material.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTrailingPressed;

  const AppBackBar({
    super.key,
    this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.onLeadingPressed,
    this.onTrailingPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.colorScheme.onSurface;

    Widget buildActionWidget(Widget child) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        child: SizedBox(
          height: 24,
          width: 24,
          child: FittedBox(fit: BoxFit.scaleDown, child: child),
        ),
      );
    }

    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: leadingWidget == null,
      actionsPadding: const EdgeInsets.only(right: 20),
      backgroundColor: theme.colorScheme.onSecondary,
      foregroundColor: iconColor,
      iconTheme: IconThemeData(color: iconColor),
      leading: leadingWidget != null
          ? IconButton(
              icon: buildActionWidget(leadingWidget!),
              onPressed: onLeadingPressed ?? () {},
            )
          : null,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: theme.textTheme.titleLarge?.copyWith(
          color: iconColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: trailingWidget != null
          ? [
              IconButton(
                icon: buildActionWidget(trailingWidget!),
                onPressed: onTrailingPressed ?? () {},
              ),
            ]
          : null,
    );
  }
}
