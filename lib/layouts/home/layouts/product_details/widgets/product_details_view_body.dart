import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_state.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/photos_widget_preview.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/product_details/product_name_details_review_price.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/review_comments/add_review_section.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/review_comments/comments_widget_builder.dart';

class ProductDetailsViewBody extends StatefulWidget {
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
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool showAddReviewSection = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void handleReviewSuccess() {
    setState(() {
      showAddReviewSection = false;
    });
    context.read<GetReviewsViewModel>().getReviews(
      token: widget.token,
      itemId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ProductDetailsViewModel, ProductDetailsViewModelStates>(
      builder: (context, state) {
        if (state is ProductDetailsSuccessState) {
          ProductDetailsModel productDetailsModel = state.productDetailsModel;
          List<String> images = productDetailsModel.images?.itemImages ?? [];

          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: PhotosWidgetPreview(
                  productImages: images,
                  key: ValueKey(images.hashCode),
                ),
              ),
              SliverToBoxAdapter(
                child: ProductNameDetailsReviewPrice(product: productDetailsModel),
              ),
              BlocBuilder<GetReviewsViewModel, GetReviewsState>(
                builder: (context, reviewState) {
                  if (reviewState is GetReviewsSuccessState) {
                    if (reviewState.reviews.isNotEmpty) {
                      return CommentsWidgetBuilder(
                        reviews: reviewState.reviews,
                        key: ValueKey(reviewState.reviews.length),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.comments_disabled_outlined,
                                size: 56,
                                color: theme.colorScheme.onSurface.withOpacity(0.4),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'No Reviews',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                'Be the first to review this product',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                  if (reviewState is GetReviewsErrorState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AppSnackBar.show(
                        context: context,
                        message: reviewState.failure.message,
                      );
                    });
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: SizedBox(
                          height: 42,
                          width: 42,
                          child: CircularProgressIndicator(strokeWidth: 4),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!showAddReviewSection)
                        ElevatedButton.icon(
                          icon: const Icon(Icons.rate_review_rounded),
                          label: const Text("Write a review"),
                          onPressed: () {
                            setState(() {
                              showAddReviewSection = true;
                            });
                            Future.delayed(
                              const Duration(milliseconds: 150),
                              () {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent + 50,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      if (showAddReviewSection)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                          child: AddReviewSection(
                            token: widget.token,
                            itemId: widget.productId,
                            buyerId: widget.userId,
                            onReviewAdded: handleReviewSuccess,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        if (state is ProductDetailsErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.primary,
          ),
        );
      },
    );
  }
}
