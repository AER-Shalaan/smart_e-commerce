import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/photos_widget_preview.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/product_details/product_name_details_review_price.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

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
              ProductNameDetailsReviewPrice(
                productData: data,
              ),
              // CommentsWidgetBuilder(),
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
