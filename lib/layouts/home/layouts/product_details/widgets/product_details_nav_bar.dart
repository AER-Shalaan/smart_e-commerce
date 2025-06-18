import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/provider/add_cart_provider.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart';

class ProductDetailsNavBar extends StatelessWidget {
  const ProductDetailsNavBar({
    super.key,
    required this.productId,
    required this.token,
    required this.userId,
  });

  final String productId;
  final String token;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                CustomDialogs.showConfirmationDialog(
                  context,
                  title: "Quantity",
                  content: "How many do you want to add to cart",
                  customContent: ChangeNotifierProvider.value(
                    value: context.read<AddCartProvider>(),
                    child: const ConfirmAddToCart(),
                  ),
                  onConfirm: () {
                    final addCartProvider = context.read<AddCartProvider>();
                    AddToCartViewModel.get(context).addToCart(
                      productId: productId,
                      token: token,
                      quantity: addCartProvider.quantity,
                      userId: userId,
                    );
                  },
                  icon: Icons.add_circle_outline,
                  iconColor: theme.colorScheme.primary,
                  cancelLabel: "Cancel",
                  confirmationLabel: "Add Now",
                  confirmationColor: theme.colorScheme.primary,
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 26,
                color: theme.colorScheme.onPrimary,
              ),
              label: Text(
                "Add To Cart",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 2.5,
                minimumSize: const Size(110, 46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: theme.colorScheme.primary.withAlpha(
                  (0.14 * 255).toInt(),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              AppSnackBar.show(
                context: context,
                message: "Added to compare!",
                backgroundColor: theme.colorScheme.secondary,
                icon: Icons.compare_arrows,
                duration: const Duration(seconds: 2),
                fromTop: false,
              );
              // TODO: Add compare logic here
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOutBack,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary.withAlpha((0.1 * 255).toInt()),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.compare_arrows_outlined,
                  color: theme.colorScheme.primary,
                  size: 29,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmAddToCart extends StatelessWidget {
  const ConfirmAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () => context.read<AddCartProvider>().decrement(),
        ),
        Selector<AddCartProvider, int>(
          selector: (_, provider) => provider.quantity,
          builder: (_, quantity, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 240),
              child: Text(
                '$quantity',
                key: ValueKey(quantity),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => context.read<AddCartProvider>().increment(),
        ),
      ],
    );
  }
}
