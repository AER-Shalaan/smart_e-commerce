import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_item_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/widgets/saved_item_card.dart';

class SavedItemWidgetBuilder extends StatelessWidget {
  const SavedItemWidgetBuilder({
    super.key,
    required this.token,
    required this.userId,
    required this.productsList,
  });
  final String token;
  final String userId;
  final List<WishlistItemModel> productsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.sizeOf(context).width >= 900
                    ? 4
                    : MediaQuery.sizeOf(context).width >= 500
                    ? 3
                    : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: MediaQuery.sizeOf(context).width >= 600 ? 320 : 280,
          ),
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            final product = productsList[index];
            return SavedItemCard(
              token: token,
              userId: userId,
              wishlistItemModel: product,
            );
          },
        ),
      ),
    );
  }
}
