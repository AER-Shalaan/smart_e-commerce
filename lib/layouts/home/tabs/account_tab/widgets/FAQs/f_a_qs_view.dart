import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/FAQs/widgtes/f_a_q_item.dart';
import '../../../../../../core/utils/text_styles.dart';
import 'Providers/faq_provider.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<FAQProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: Text(
          "FAQs",
          style: TextStyles.headlineStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (query) => faqProvider.filterFAQs(query),
              decoration: InputDecoration(
                hintText: 'Search for questions...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
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
