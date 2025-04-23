import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/widgets/saved_item_card.dart';

class SavedItemWidgetBuilder extends StatelessWidget {
  const SavedItemWidgetBuilder({super.key, required this.products});
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.sizeOf(context).width >= 900
                    ? 4
                    : MediaQuery.sizeOf(context).width >= 500
                    ? 3
                    : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: MediaQuery.sizeOf(context).width >= 600 ? 320 : 280,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return SavedItemCard(
              imagePath: product['imagePath'],
              title: product['title'],
              price: product['price'],
              descount: product['discount'],
            );
          },
        ),
      ),
    );
  }
}
