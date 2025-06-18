import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model_states.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final snackBarBackgroundSuccess = theme.colorScheme.secondary;
    final snackBarBackgroundError = theme.colorScheme.error;

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
          final List<dynamic> data =
              ModalRoute.of(context)!.settings.arguments as List;
          final productId = data[0] as String;
          final token = data[1] as String;
          final userId = data[2] as String;

          context.read<ProductDetailsViewModel>().getProductDetails(
            productId: productId,
            token: token,
          );
          context.read<GetReviewsViewModel>().getReviews(
            token: token,
            itemId: productId,
          );

          return MultiBlocListener(
            listeners: [
              BlocListener<
                AddToWishlistViewModel,
                AddToWishlistViewModelStates
              >(
                listener: (context, state) {
                  if (state is AddToWishlistSuccess) {
                    AppSnackBar.show(
                      context: context,
                      message: state.response.messageToUser,
                      backgroundColor: snackBarBackgroundSuccess,
                      icon: Icons.favorite,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  } else if (state is AddToWishlistFailure) {
                    AppSnackBar.show(
                      context: context,
                      message: state.error.message,
                      backgroundColor: snackBarBackgroundError,
                      icon: Icons.error,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  }
                },
              ),
              BlocListener<AddToCartViewModel, AddToCartViewModelStates>(
                listener: (context, state) {
                  if (state is AddToCartSuccessState) {
                    AppSnackBar.show(
                      context: context,
                      message: "Added to cart successfully",
                      backgroundColor: theme.colorScheme.primary,
                      icon: Icons.done,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  }
                  if (state is AddToCartErrorState) {
                    AppSnackBar.show(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: theme.colorScheme.error,
                      icon: Icons.error,
                      duration: const Duration(seconds: 2),
                      fromTop: false,
                    );
                  }
                },
              ),
            ],
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: productDetailsViewAppBar(
                  context,
                  token: token,
                  productId: productId,
                  userId: userId,
                ),
              ),
              body: ProductDetailsViewBody(
                token: token,
                productId: productId,
                userId: userId,
              ),
              bottomNavigationBar: ProductDetailsNavBar(
                token: token,
                productId: productId,
                userId: userId,
              ),
            ),
          );
        },
      ),
    );
  }
}
