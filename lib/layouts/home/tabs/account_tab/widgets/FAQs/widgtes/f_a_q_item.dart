import 'package:flutter/material.dart';

import '../../../../../../../core/utils/text_styles.dart';
import '../model/f_a_q.dart';

class FAQItem extends StatelessWidget {
  final FAQ faq;
  final VoidCallback onTap;

  const FAQItem({super.key, required this.faq, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(faq.question, style: TextStyles.fAQsLabels),
        initiallyExpanded: faq.isExpanded,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        dense: true,
        onExpansionChanged: (expanded) => onTap(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(faq.answer, style: TextStyles.fAQsTexts),
          ),
        ],
      ),
    );
  }
}
