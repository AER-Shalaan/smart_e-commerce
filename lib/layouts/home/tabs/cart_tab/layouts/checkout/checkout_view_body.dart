import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_main_button.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/providers/parameters_payment_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/view_model/payment_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/view_model/payment_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/widgets/delivery_address.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/widgets/order_summary_item.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/widgets/payment_methods_list_view.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/payment_web_view/payment_web_view.dart';

class CheckoutViewBody extends StatelessWidget {
  final String token;
  final String userId;
  final List<CartModel> cartItems;
  final double total;
  const CheckoutViewBody({
    super.key,
    required this.token,
    required this.userId,
    required this.cartItems,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<ParametersPaymentProvider>(context);

    return BlocListener<PaymentViewModel, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
        if (state is PaymentSuccess) {
          final url = state.paymentResponse.paymentUrl;
          log('Open Payment WebView: $url');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PaymentWebView(url: url)),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 40, thickness: 1),
          DeliveryAddress(token: token, userId: userId),
          Divider(height: 40, thickness: 1),
          Text("Payment Method"),
          SizedBox(height: 16),
          PaymentMethodsListView(),
          Divider(height: 40, thickness: 1),
          Text("Order Summary"),
          SizedBox(height: 10),
          OrderSummaryItem(
            name: "name",
            quantity: "quantity",
            price: "price",
            isHeader: true,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return OrderSummaryItem(
                  name: cartItem.itemName,
                  quantity: cartItem.quantity.toString(),
                  price: "\$${cartItem.priceOut - cartItem.discount}",
                );
              },
            ),
          ),
          Divider(height: 40, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.hintColor,
                ),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomMainButton(
              label: "Place Order",
              onPressed:
                  provider.paymentMethodId == null || provider.addressId == null
                      ? null
                      : () {
                        context.read<PaymentViewModel>().startPayment(
                          integrationId: provider.paymentMethodId!,
                          userId: userId,
                          addressId: provider.addressId!,
                          token: token,
                        );
                      },
              isDisabled:
                  provider.paymentMethodId == null ||
                  provider.addressId == null,
            ),
          ),
        ],
      ),
    );
  }
}
