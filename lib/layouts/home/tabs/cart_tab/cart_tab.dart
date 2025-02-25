import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/provider/cart_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/shopping_cart_item.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/summary_row.dart';

import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/assets.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});
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

  @override
  Widget build(BuildContext context) {
    CartProvider provider = Provider.of<CartProvider>(context);
    double subTotal = calculateSubTotal(provider.cartItems);
    double vat = 15;
    double shippingFee = calculateShippingFee(subTotal);
    double total = subTotal + vat + shippingFee;

    return provider.isCartEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImagesCartDuotone,
                    width: 64, height: 64),
                const SizedBox(height: 10),
                const Text(
                  "Your Cart Is Empty!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "When you add products, they'll appear here.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.cartItems.length,
                  itemBuilder: (context, index) {
                    var item = provider.cartItems[index];

                    double discountedPrice = item['price'] -
                        (item['price'] * item['discountPercentage'] / 100);
                    return ShoppingCartItem(
                      image: item['image'],
                      name: item['name'],
                      price: item['price'],
                      discountedPrice: discountedPrice,
                      rating: item['rating'],
                      quantity: item['quantity'],
                      isAvailable: item['isAvailable'],
                      category: item['category'],
                      onQuantityChanged: (newQuantity) {
                        provider.updateQuantity(index, newQuantity);
                      },
                      onDelete: () {
                        provider.removeItem(index);
                      },
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
                        value: calculateVat(subTotal, vat).toInt()),
                    SummaryRow(
                        label: 'Shipping fee', value: shippingFee.toInt()),
                    const Divider(height: 1, color: Colors.grey),
                    SummaryRow(
                        label: 'Total',
                        value: total.toInt(),
                        isBold: true,
                        isBlack: true),
                    const SizedBox(height: 30),
                    const CustomMainButton(label: "Go To Checkout")
                  ],
                ),
              ),
            ],
          );
  }
}
