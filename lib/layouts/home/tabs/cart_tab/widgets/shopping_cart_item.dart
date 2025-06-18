import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model_states.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartModel item;
  final String token;
  final String userId;

  const ShoppingCartItem({
    super.key,
    required this.item,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<String>? data = [item.itemID, token, userId];
    final width = MediaQuery.of(context).size.width;
    final imgWidth = width * 0.19 > 110 ? 110.0 : width * 0.19;
    final imgHeight = imgWidth * 0.8;

    return BlocBuilder<
      DelItemFromCartViewModel,
      DelItemFromCartViewModelStates
    >(
      buildWhen: (previous, current) {
        if (current is DelItemFromCartLoadingState &&
            current.deletingItemId == item.itemID) {
          return true;
        }
        if (previous is DelItemFromCartLoadingState &&
            previous.deletingItemId == item.itemID) {
          return true;
        }
        if (current is DelItemFromCartSuccessState ||
            current is DelItemFromCartErrorState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final isDeleting =
            state is DelItemFromCartLoadingState &&
            state.deletingItemId == item.itemID;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            color: theme.cardColor,
            shadowColor: Colors.black.withAlpha(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // صورة المنتج مع InkWell للانتقال للتفاصيل
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.productDetailsView,
                        arguments: data,
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: theme.dividerColor.withAlpha(30),
                        width: imgWidth,
                        height: imgHeight,
                        child: Image.network(
                          Constants.baseUrl + item.imageCover,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Icon(
                                Icons.broken_image,
                                color: theme.hintColor,
                                size: imgWidth * 0.6,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Expanded حول باقي البيانات لضمان الاستجابة
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.itemName,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // الأسعار والخصم كل سعر في سطر منفصل
                        if (item.discount > 0) ...[
                          Text(
                            "${item.priceOut} EGP",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: theme.hintColor,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              Text(
                                "${item.priceOut - item.discount} EGP",
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "-${item.discount} EGP",
                                  style: TextStyle(
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          Text(
                            "${item.priceOut} EGP",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        // Quantity
                        Row(
                          children: [
                            Text(
                              "Quantity:",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.primaryColor.withOpacity(0.09),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${item.quantity}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.5,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Delete Button or Loader
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (child, anim) =>
                            FadeTransition(opacity: anim, child: child),
                    child:
                        isDeleting
                            ? SizedBox(
                              width: 34,
                              height: 34,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.8,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.error,
                                ),
                              ),
                            )
                            : IconButton(
                              key: const ValueKey("deleteBtn"),
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                size: 28,
                                color: Colors.redAccent,
                              ),
                              tooltip: "Delete item",
                              onPressed: () {
                                context
                                    .read<DelItemFromCartViewModel>()
                                    .removeItemFromCart(
                                      token: token,
                                      buyerId: userId,
                                      itemId: item.itemID,
                                    );
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
