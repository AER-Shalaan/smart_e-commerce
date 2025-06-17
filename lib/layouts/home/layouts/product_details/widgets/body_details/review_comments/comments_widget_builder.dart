import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/review_model.dart';
import 'comments_widget.dart';

class CommentsWidgetBuilder extends StatelessWidget {
  final List<ReviewModel> reviews;
  const CommentsWidgetBuilder({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [CommentsWidget(comment: reviews[index])]);
      }, childCount: reviews.length),
    );
  }
}
