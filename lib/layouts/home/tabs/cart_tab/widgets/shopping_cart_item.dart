import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/update_cart_view_model/update_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/update_cart_view_model/update_cart_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/cart_image.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/cart_info.dart';

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
    final width = MediaQuery.of(context).size.width;

    double cardPadding = (width * 0.032).clamp(10.0, 18.0);
    double verticalPadding = (width * 0.04).clamp(12.0, 22.0);
    double imageToTextGap = (width * 0.032).clamp(10.0, 17.0);
    double cardRadius = (width * 0.047).clamp(13.0, 22.0);

    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: width * 0.93,
          margin: EdgeInsets.symmetric(vertical: cardPadding / 2),
          child: BlocBuilder<
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
            builder: (context, delState) {
              final isDeleting =
                  delState is DelItemFromCartLoadingState &&
                  delState.deletingItemId == item.itemID;
              return BlocBuilder<
                UpdateCartViewModel,
                UpdateCartViewModelStates
              >(
                buildWhen: (previous, current) {
                  if (current is UpdateCartLoadingState &&
                      current.updatingItemId == item.itemID) {
                    return true;
                  }
                  if (previous is UpdateCartLoadingState &&
                      previous.updatingItemId == item.itemID) {
                    return true;
                  }
                  if (current is UpdateCartSuccessState ||
                      current is UpdateCartErrorState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, updateState) {
                  final isUpdating =
                      updateState is UpdateCartLoadingState &&
                      updateState.updatingItemId == item.itemID;
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardRadius),
                    ),
                    elevation: 3,
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalPadding,
                        horizontal: cardPadding,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CartImage(
                            item: item,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.productDetailsView,
                                arguments: [item.itemID, token, userId],
                              );
                            },
                          ),
                          SizedBox(width: imageToTextGap),
                          Expanded(
                            child: CartInfo(
                              item: item,
                              isDeleting: isDeleting,
                              token: token,
                              userId: userId,
                              isUpdating: isUpdating,
                              onIncrease: () {
                                context
                                    .read<UpdateCartViewModel>()
                                    .updateCartItem(
                                      token: token,
                                      buyerId: userId,
                                      itemId: item.itemID,
                                      quantity: item.quantity + 1,
                                    );
                              },
                              onDecrease:
                                  item.quantity > 1
                                      ? () {
                                        context
                                            .read<UpdateCartViewModel>()
                                            .updateCartItem(
                                              token: token,
                                              buyerId: userId,
                                              itemId: item.itemID,
                                              quantity: item.quantity - 1,
                                            );
                                      }
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
