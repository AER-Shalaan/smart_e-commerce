import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_item_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/provider/wishlist_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/del_Item_from_wishlist/del_item_form_wishlist_view_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/routes.dart';

class SavedItemCard extends StatefulWidget {
  const SavedItemCard({
    super.key,
    required this.wishlistItemModel,
    required this.token,
    required this.userId,
  });
  final String token;
  final String userId;
  final WishlistItemModel wishlistItemModel;

  @override
  State<SavedItemCard> createState() => _SavedItemCardState();
}

class _SavedItemCardState extends State<SavedItemCard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WishlistProvider>(context);
    var width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.antiAlias,
      children: [
        InkWell(
          enableFeedback: false,
          onTap:
              () => Navigator.pushNamed(
                context,
                Routes.productDetailsView,
                arguments: [
                  widget.wishlistItemModel.itemId,
                  widget.token,
                  widget.userId,
                ],
              ),
          child: Container(
            width: width >= 600 ? 280 : 240,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: theme.dividerColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      Constants.baseUrl + widget.wishlistItemModel.imageCover,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.secondary,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: theme.disabledColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.wishlistItemModel.itemName,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.secondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${(widget.wishlistItemModel.priceOut).toStringAsFixed(2)}",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.disabledColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${((widget.wishlistItemModel.priceOut) - (widget.wishlistItemModel.discount)).toStringAsFixed(2)}",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.textTheme.bodyLarge?.color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 6),
                          if ((widget.wishlistItemModel.discount) > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.error,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "-\$${widget.wishlistItemModel.discount}",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onError,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            overlayColor: WidgetStatePropertyAll(
              theme.colorScheme.primary.withAlpha(70),
            ),
            onTap: () {
              BlocProvider.of<DelItemFormWishlistViewModel>(
                context,
              ).delItemFromWishlist(
                token: widget.token,
                userId: widget.userId,
                itemId: widget.wishlistItemModel.itemId,
              );
              AppSnackBar.show(
                context: context,
                message: "Item removed successfully",
              );
              provider.removefromWishlist(widget.wishlistItemModel);
            },
            child: Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(Assets.assetsIconsHeartFilled),
            ),
          ),
        ),
      ],
    );
  }
}
