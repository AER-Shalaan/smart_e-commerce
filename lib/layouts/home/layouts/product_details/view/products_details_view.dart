import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_review_view_model/add_review_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/check_review_view_model/check_review_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_nav_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_app_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/product_details_view_body.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model_states.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductDetailsViewModel>()),
        BlocProvider(create: (context) => getIt<AddToCartViewModel>()),
        BlocProvider(create: (context) => getIt<AddToWishlistViewModel>()),
        BlocProvider(create: (context) => getIt<GetReviewsViewModel>()),
        BlocProvider(create: (context) => getIt<CheckReviewViewModel>()),
        BlocProvider(create: (context) => getIt<AddReviewViewModel>()),
      ],
      child: Builder(
        builder: (context) {
          final List<String?> data =
              ModalRoute.of(context)!.settings.arguments as List<String?>;

          context.read<ProductDetailsViewModel>().getProductDetails(
            productId: data[0] ?? "",
            token: data[1] ?? "",
          );
          context.read<GetReviewsViewModel>().getReviews(
            token: data[1] ?? "",
            itemId: data[0] ?? "",
          );

          return Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: BlocListener<
                AddToWishlistViewModel,
                AddToWishlistViewModelStates
              >(
                listener: (context, state) {
                  if (state is AddToWishlistSuccess) {
                    AppSnackBar.show(
                      context: context,
                      message: state.response.messageToUser,
                      backgroundColor: Colors.pink,
                      icon: Icons.favorite,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  } else if (state is AddToWishlistFailure) {
                    AppSnackBar.show(
                      context: context,
                      message: state.error.message,
                      backgroundColor: Colors.red,
                      icon: Icons.error,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  }
                },
                child: productDetailsViewAppBar(
                  context,
                  token: data[1] ?? "",
                  productId: data[0] ?? "",
                  userId: data[2] ?? "",
                ),
              ),
            ),
            body: ProductDetailsViewBody(
              key: ValueKey(data[0]),
              token: data[1] ?? "",
              productId: data[0] ?? "",
              userId: data[2] ?? "",
            ),
            bottomNavigationBar: ProductDetailsNavBar(
              token: data[1] ?? "",
              productId: data[0] ?? "",
              userId: data[2] ?? "",
            ),
          );
        },
      ),
    );
  }
}
