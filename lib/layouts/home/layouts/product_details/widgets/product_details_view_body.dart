import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_state.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/photos_widget_preview.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/product_details/product_name_details_review_price.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/review_comments/add_review_section.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/review_comments/comments_widget_builder.dart';

class ProductDetailsViewBody extends StatelessWidget {
  final String productId;
  final String userId;
  final String token;
  const ProductDetailsViewBody({
    super.key,
    required this.productId,
    required this.userId,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsViewModel, ProductDetailsViewModelStates>(
      builder: (context, state) {
        if (state is ProductDetailsSuccessState) {
          ProductDetailsModel productDetailsModel = state.productDetailsModel;
          List<String> images = productDetailsModel.images?.itemImages ?? [];
          ProductsData data = productDetailsModel.data!;
          return CustomScrollView(
            slivers: [
              PhotosWidgetPreview(productImages: images),
              ProductNameDetailsReviewPrice(productData: data),
              SliverToBoxAdapter(
                child: AddReviewSection(
                  token: token,
                  itemId: productId,
                  buyerId: userId,
                ),
              ),
              BlocBuilder<GetReviewsViewModel, GetReviewsState>(
                builder: (context, state) {
                  if (state is GetReviewsSuccessState) {
                    if (state.reviews.isNotEmpty) {
                      return CommentsWidgetBuilder(reviews: state.reviews);
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.comments_disabled_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'No Reviews',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Be the first to review this product',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  if (state is GetReviewsErrorState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AppSnackBar.show(
                        context: context,
                        message: state.failure.message,
                      );
                    });
                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  }

                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                },
              ),
            ],
          );
        }
        if (state is ProductDetailsErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
