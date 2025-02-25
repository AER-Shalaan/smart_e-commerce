import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_app_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_body.dart';
class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String>? data =
        ModalRoute.of(context)!.settings.arguments as List<String>?;

    return BlocProvider(
      create: (context) => getIt<ProductDetailsViewModel>()
        ..getProductDetails(productId: data?[0] ?? "", token: data?[1] ?? ""),
      child: Scaffold(
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
      ),
    );
  }
}
