import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_nav_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_app_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_body.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String>? data =
        ModalRoute.of(context)!.settings.arguments as List<String>?;

    return BlocProvider(
      create:
          (context) =>
              getIt<ProductDetailsViewModel>()..getProductDetails(
                productId: data?[0] ?? "",
                token: data?[1] ?? "",
              ),
      child: BlocProvider(
        create: (context) => getIt<AddToCartViewModel>(),
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: productDetailsViewAppBar(context),
          body: const ProductDetailsViewBody(),
          bottomNavigationBar: ProductDetailsNavBar(
            token: data?[1] ?? "",
            productId: data?[0] ?? "", userId: data?[2] ?? "",
          ),
        ),
      ),
    );
  }
}
