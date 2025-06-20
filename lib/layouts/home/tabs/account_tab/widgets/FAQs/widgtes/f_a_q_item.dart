import 'package:flutter/material.dart';
import '../model/f_a_q.dart';

class FAQItem extends StatelessWidget {
  final FAQ faq;
  final VoidCallback onTap;

  const FAQItem({super.key, required this.faq, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha(50)
                : Colors.grey.withAlpha(30),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Card(
        color: theme.cardColor,
        surfaceTintColor: theme.cardColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Theme(
          data: theme.copyWith(
            dividerColor: Colors.transparent,
            splashColor: theme.colorScheme.primary.withAlpha(20),
            highlightColor: theme.colorScheme.primary.withAlpha(18),
            expansionTileTheme: ExpansionTileThemeData(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              iconColor: theme.colorScheme.primary,
              collapsedIconColor: theme.colorScheme.secondary.withAlpha(180),
            ),
          ),
          child: ExpansionTile(
            initiallyExpanded: faq.isExpanded,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
            trailing: AnimatedRotation(
              turns: faq.isExpanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Icon(
                Icons.expand_more_rounded,
                size: 28,
                color: theme.colorScheme.primary,
              ),
            ),
            onExpansionChanged: (_) => onTap(),
            title: Text(
              faq.question,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                letterSpacing: 0.05,
              ),
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  faq.answer,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withAlpha(210),
                    fontSize: 15,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
