import 'package:flutter/material.dart';
import 'body_titles.dart';
import 'item_widget.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.label,
    required this.products,
  });

  final String label;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyTitles(title: label),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.sizeOf(context).width >= 600 ? 320 : 280,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ItemWidget(
                  imagePath: product['imagePath'],
                  title: product['title'],
                  price: product['price'],
                  descount: product['descount'],
                  review: product['review'],
                  reviewersCount: product['reviewersCount'],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
        ],
      ),
    );
  }
}
