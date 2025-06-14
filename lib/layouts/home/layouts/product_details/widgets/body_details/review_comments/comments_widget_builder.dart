import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/review_comments/comments_widget.dart';

class CommentsWidgetBuilder extends StatelessWidget {
  const CommentsWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const CommentsWidget(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 5,
    );
  }
}
