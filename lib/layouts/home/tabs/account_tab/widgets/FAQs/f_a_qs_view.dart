import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/FAQs/widgtes/f_a_q_item.dart';
import 'Providers/faq_provider.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final faqProvider = Provider.of<FAQProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: Text(
          "FAQs",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.primary,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (query) => faqProvider.filterFAQs(query),
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Search for questions...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                filled: true,
                fillColor: theme.cardColor.withAlpha(225),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: faqProvider.filteredFaqs.length,
                itemBuilder: (context, index) {
                  final faq = faqProvider.filteredFaqs[index];
                  return FAQItem(
                    faq: faq,
                    onTap: () => faqProvider.toggleFAQ(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
