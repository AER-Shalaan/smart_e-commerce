import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';

class ChatBotProductListBuilder extends StatelessWidget {
  final List<ProductsData> products;
  final String? label;
  final String token;
  final String userId;

  const ChatBotProductListBuilder({
    super.key,
    required this.products,
    this.label,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              label!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              final product = products[index];
              return SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: ItemWidget(
                  key: ValueKey(product.itemID),
                  productData: product,
                  token: token,
                  userId: userId,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
