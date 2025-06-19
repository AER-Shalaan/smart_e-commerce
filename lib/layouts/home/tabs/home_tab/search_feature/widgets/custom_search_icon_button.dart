import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/widgets/search_screen.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
    required this.token,
    required this.userId,
  });
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return IconButton(
      icon: Icon(Icons.search, color: theme.colorScheme.secondary, size: 30),
      onPressed: () {
        showSearch(
          context: context,
          delegate: SearchScreen(token: token, userId: userId),
        );
      },
    );
  }
}
