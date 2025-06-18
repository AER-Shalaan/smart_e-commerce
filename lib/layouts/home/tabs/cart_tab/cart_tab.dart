import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/get_cart_view_model/get_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/get_cart_view_model/get_cart_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/shopping_cart_item.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/summary_row.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key, required this.token, required this.userId});
  final String token;
  final String userId;

  double calculateCartTotal(List<CartModel> cartItems) {
    double total = 0;
    for (final item in cartItems) {
      final discountedPrice = item.priceOut - item.discount;
      total += discountedPrice * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  getIt<GetCartViewModel>()
                    ..getCart(token: token, userId: userId),
        ),
        BlocProvider(create: (_) => getIt<DelItemFromCartViewModel>()),
      ],
      child: BlocListener<
        DelItemFromCartViewModel,
        DelItemFromCartViewModelStates
      >(
        listener: (context, state) {
          if (state is DelItemFromCartSuccessState) {
            context.read<GetCartViewModel>().getCart(
              token: token,
              userId: userId,
            );
            AppSnackBar.show(
              context: context,
              message: "Item removed from cart successfully.",
              icon: Icons.check_circle,
              backgroundColor: Colors.green,
            );
          }
          if (state is DelItemFromCartErrorState) {
            AppSnackBar.show(
              context: context,
              message: state.errorMessage,
              icon: Icons.error,
              backgroundColor: Colors.red,
            );
          }
        },
        child: BlocBuilder<GetCartViewModel, GetCartViewModelStates>(
          builder: (context, state) {
            if (state is GetCartViewModelLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetCartViewModelError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is GetCartViewModelSuccess) {
              final cartItems = state.cartModel;
              if (cartItems.isEmpty) {
                // <-- كده الرسالة دايمًا في وسط الشاشة مهما كان حجمها -->
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, size: 80, color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text(
                          'Your cart is empty!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Add items to your cart to checkout.',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              }
              final total = calculateCartTotal(cartItems);
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ShoppingCartItem(
                          item: item,
                          token: token,
                          userId: userId,
                        );
                      },
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                      child: Column(
                        children: [
                          SummaryRow(label: "Total", value: total),
                          const SizedBox(height: 12),
                          CustomMainButton(label: 'Checkout', onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
