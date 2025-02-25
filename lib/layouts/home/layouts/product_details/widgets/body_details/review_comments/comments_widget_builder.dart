import 'package:flutter/material.dart';

import 'comments_widget.dart';

class CommentsWidgetBuilder extends StatelessWidget {
  const CommentsWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemBuilder: (context, index) => const CommentsWidget(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
        itemCount: 5);
  }
}
