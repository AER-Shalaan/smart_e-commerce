import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/providers/parameters_payment_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametersPaymentProvider>(context);

    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                provider.setPaymentMethod(5037623, 0);
              },
              child: PaymentMethodItem(
                iconPath: Assets.assetsIconsCard,
                isSelected: provider.activeIndex == 0,
                hasLabel: true,
                label: "Card",
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                provider.setPaymentMethod(5037729, 1);
              },
              child: PaymentMethodItem(
                label: "Wallet",
                hasLabel: true,
                iconPath: Assets.assetsIconsWallet,
                isSelected: provider.activeIndex == 1,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                provider.setPaymentMethod(5146827, 2);
              },
              child: PaymentMethodItem(
                iconPath: Assets.assetsIconsCash,
                hasLabel: true,
                label: "Cash",
                isSelected: provider.activeIndex == 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
