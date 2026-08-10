import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HelpOptionCard extends StatelessWidget {
   final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const HelpOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap
    
    });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(
        minHeight: 151,
      ),
      width: 158,
       padding: const EdgeInsetsDirectional.fromSTEB(
            16,
            24,
            16,
            16,
          ),
      
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        border: BoxBorder.all(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16 ,top: 24),
              child: Icon(icon,size: 24,color: colorScheme.primary,),
            ),
            Text(title,style:AppTextStyles.body14Medium.copyWith(color: colorScheme.onSurface)),
            Text(subtitle,style:AppTextStyles.body14Regular.copyWith(color: colorScheme.onSurfaceVariant)),
        
          ],
        ),
      ),
    );
  }
}