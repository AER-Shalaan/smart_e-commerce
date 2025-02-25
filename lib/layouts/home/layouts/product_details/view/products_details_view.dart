import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../widgets/product_details_view_app_bar.dart';
import '../widgets/product_details_view_body.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: productDetailsViewAppBar(context),
      body: const ProductDetailsViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add To Cart"),
                        SizedBox(width: 8),
                        Icon(Icons.shopping_cart_outlined)
                      ],
                    ))),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.favorite_border),
            ),
            ElevatedButton(
              onPressed: () {
                // onAddToCompare(product);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("${product['name']} added to comparison")),
                // );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.compare_arrows_outlined),
            )
          ],
        ),
      ),
    );
  }
}
