import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/item_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class StaticProductListBuilder extends StatelessWidget {
  const StaticProductListBuilder({
    super.key,
    required this.label,
    required this.token,
    required this.userId,
    required this.products,
  });

  final String label;
  final String token;
  final String userId;
  final List<ProductDetailsModel> products;

  Widget _buildProductItem(BuildContext context, int index) {
    final product = products[index];
    return ItemWidget(
      key: ValueKey(product.data!.itemID),
      product: product,
      token: token,
      userId: userId,
    );
  }

  Widget buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: isTablet ? 330 : 290,
          child: products.isEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => buildShimmerItem(),
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: 5,
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length,
                  itemBuilder: _buildProductItem,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                ),
        ),
      ],
    );
  }
}
