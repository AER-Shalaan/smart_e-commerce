import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model_states.dart';

class CartDeleteButton extends StatelessWidget {
  final String itemId;
  final String token;
  final String userId;

  const CartDeleteButton({
    super.key,
    required this.itemId,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<
      DelItemFromCartViewModel,
      DelItemFromCartViewModelStates
    >(
      listener: (context, state) {
        if (state is DelItemFromCartSuccessState) {
          AppSnackBar.show(
            context: context,
            message: "Item removed from cart successfully",
            icon: Icons.check_circle,
            backgroundColor: theme.colorScheme.primary,
          );
        } else if (state is DelItemFromCartErrorState) {
          AppSnackBar.show(
            context: context,
            message: state.errorMessage,
            icon: Icons.error,
            backgroundColor: theme.colorScheme.error,
          );
        }
      },
      builder: (context, state) {
        if (state is DelItemFromCartLoadingState) {
          return CircularProgressIndicator(strokeWidth: 2);
        }
        return IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<DelItemFromCartViewModel>().removeItemFromCart(
              token: token,
              itemId: itemId,
              buyerId: userId,
            );
          },
        );
      },
    );
  }
}
