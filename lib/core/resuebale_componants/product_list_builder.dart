import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/body_titles.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.label,
    required this.products,
    required this.index,
    required this.token,
    required this.userId,
  });

  final String label;
  final List<Products> products;
  final int index;
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: index,
            itemBuilder: (context, index) {
              final product = products[index].data;
              return ItemWidget(
                productData: product!,
                token: token,
                userId: userId,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
          ),
        ),
      ],
    );
  }
}
