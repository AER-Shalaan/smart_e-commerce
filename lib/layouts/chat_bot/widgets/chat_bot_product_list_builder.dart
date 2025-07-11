import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/item_widget.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class ChatBotProductListBuilder extends StatelessWidget {
  final List<ProductDetailsModel> products;
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

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              label!,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              return SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.44,
                child: ItemWidget(
                  key: ValueKey(product.data!.itemID),
                  product: product,
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
