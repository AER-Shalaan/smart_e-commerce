import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/get_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/get_cart_view_model_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/shopping_cart_item.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/summary_row.dart';

import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/assets.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key, required this.token, required this.userId});
  double calculateSubTotal(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(0, (sum, item) {
      double discountedPrice =
          item['price'] - (item['price'] * item['discountPercentage'] / 100);
      return sum + (discountedPrice * item['quantity']);
    });
  }

  double calculateVat(double subTotal, double vatPercentage) {
    return subTotal * vatPercentage / 100;
  }

  double calculateShippingFee(double subTotal) {
    return subTotal > 10000 ? 0 : 50;
  }

  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    double subTotal = 222;
    double vat = 15;
    double shippingFee = calculateShippingFee(subTotal);
    double total = subTotal + vat + shippingFee;

    return BlocProvider(
      create:
          (context) =>
              getIt<GetCartViewModel>()..getCart(token: token, userId: userId),
      child: BlocBuilder<GetCartViewModel, GetCartViewModelStates>(
        builder: (context, state) {
          if (state is GetCartViewModelSuccess) {
            if (state.cartModel.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.assetsImagesCartDuotone,
                      width: 64,
                      height: 64,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your Cart Is Empty!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "When you add products, they'll appear here.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartModel.length,
                      itemBuilder: (context, index) {
                        var item = state.cartModel[index];

                        // double discountedPrice =
                        //     item['price'] -
                        //     (item['price'] * item['discountPercentage'] / 100);
                        return ShoppingCartItem(
                          cartModel: item,
                          token: token,
                          userId: userId,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SummaryRow(label: 'Sub-total', value: subTotal.toInt()),
                        SummaryRow(
                          label: 'VAT (%)',
                          value: calculateVat(subTotal, vat).toInt(),
                        ),
                        SummaryRow(
                          label: 'Shipping fee',
                          value: shippingFee.toInt(),
                        ),
                        const Divider(height: 1, color: Colors.grey),
                        SummaryRow(
                          label: 'Total',
                          value: total.toInt(),
                          isBold: true,
                          isBlack: true,
                        ),
                        const SizedBox(height: 30),
                        const CustomMainButton(label: "Go To Checkout"),
                      ],
                    ),
                  ),
                ],
              );
            }
          }
          if (state is GetCartViewModelError) {
            return Text(state.message);
          }
          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
