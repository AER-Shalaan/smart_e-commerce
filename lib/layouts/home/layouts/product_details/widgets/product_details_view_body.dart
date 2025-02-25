import 'package:flutter/material.dart';

import 'body_details/photos_widgets/photos_widget_preview.dart';
import 'body_details/product_details/product_name_details_review_price.dart';
import 'body_details/review_comments/comments_widget_builder.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        PhotosWidgetPreview(),
        ProductNameDetailsReviewPrice(),
        CommentsWidgetBuilder(),
      ],
    );
  }
}
