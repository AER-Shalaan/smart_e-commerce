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
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.05),
      child: GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchScreen(token: token, userId: userId),
          );
        },
        child: Icon(Icons.search, color: Colors.black),
      ),
    );
  }
}
