import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/provider/add_cart_provider.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model_states.dart';

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
    AddCartProvider addCartProvider = Provider.of<AddCartProvider>(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<AddToCartViewModel, AddToCartViewModelStates>(
          listener: (context, state) {
            if (state is AddToCartSuccessState) {
              AppSnackBar.show(
                context: context,
                message: "Added to cart successfully",
                backgroundColor: AppColors.primary,
                icon: Icons.done,
                duration: const Duration(seconds: 2),
                fromTop: false,
              );
            }
            if (state is AddToCartErrorState) {
              log(state.errorMessage);
            }
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((255 * 0.07).toInt()),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 340),
                curve: Curves.easeInOut,
                child: ElevatedButton.icon(
                  onPressed: () {
                    CustomDialogs.showConfirmationDialog(
                      context,
                      title: "Quantify",
                      content: "How many do you want to add to cart",
                      customContent: ChangeNotifierProvider(
                        create: (context) => AddCartProvider(),
                        child: const ConfirmAddToCart(),
                      ),
                      onConfirm: () {
                        log(addCartProvider.quantity.toString());
                        AddToCartViewModel.get(context).addToCart(
                          productId: productId,
                          token: token,
                          quantity: addCartProvider.quantity,
                          userId: userId,
                        );
                      },
                      icon: Icons.add_circle_outline,
                      iconColor: AppColors.primary,
                      cancelLabel: "Cancel",
                      confirmationLabel: "Add, Now",
                      confirmationColor: AppColors.primary,
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 26),
                  label: const Text("Add To Cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 2.5,
                    minimumSize: const Size(110, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    shadowColor: AppColors.primary.withAlpha(
                      (255 * 0.14).toInt(),
                    ),
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
                  backgroundColor: Colors.deepPurple,
                  icon: Icons.compare_arrows,
                  duration: const Duration(seconds: 2),
                  fromTop: false,
                );
                // TODO: Add your compare logic here
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOutBack,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withAlpha((255 * 0.09).toInt()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.compare_arrows_outlined,
                    color: AppColors.primary,
                    size: 29,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmAddToCart extends StatelessWidget {
  const ConfirmAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    AddCartProvider addCartProvider = Provider.of<AddCartProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            addCartProvider.decrement();
          },
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 240),
          child: Text(
            '${addCartProvider.quantity}',
            key: ValueKey(addCartProvider.quantity),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            addCartProvider.increment();
          },
        ),
      ],
    );
  }
}
