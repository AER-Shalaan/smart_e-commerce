import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/review_model.dart';

import 'comments_widget.dart';

class CommentsWidgetBuilder extends StatefulWidget {
  final List<ReviewModel> reviews;
  const CommentsWidgetBuilder({super.key, required this.reviews});

  @override
  State<CommentsWidgetBuilder> createState() => _CommentsWidgetBuilderState();
}

class _CommentsWidgetBuilderState extends State<CommentsWidgetBuilder> {
  int visibleCount = 3;

  @override
  Widget build(BuildContext context) {
    final allCount = widget.reviews.length;
    final visibleReviews = widget.reviews.take(visibleCount).toList();
    final hasMore = visibleCount < allCount;
    final hasLess = visibleCount >= allCount && allCount > 3;

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < visibleReviews.length) {
          return CommentsWidget(comment: visibleReviews[index]);
        } else {
          return Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (hasMore) {
                    visibleCount += 3;
                    if (visibleCount > allCount) visibleCount = allCount;
                  } else if (hasLess) {
                    visibleCount = 3;
                  }
                });
              },
              child: Text(
                hasMore ? "See more" : "See less",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          );
        }
      }, childCount: visibleReviews.length + (allCount > 3 ? 1 : 0)),
    );
  }
}
