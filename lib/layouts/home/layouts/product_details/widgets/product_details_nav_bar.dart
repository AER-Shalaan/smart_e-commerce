import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
  });
  final String productId;
  final String token;
  @override
  Widget build(BuildContext context) {
    AddCartProvider addCartProvider = Provider.of<AddCartProvider>(context);
    return BlocListener<AddToCartViewModel, AddToCartViewModelStates>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Product added to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
        if (state is AddToCartErrorState) {
          log(state.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  CustomDialogs.showConfirmationDialog(
                    context,
                    title: "Quantify",
                    content: "How many do you want to add to cart",
                    customContent: ChangeNotifierProvider(
                      create: (context) => AddCartProvider(),
                      child: ConfirmAddToCart(),
                    ),
                    onConfirm: () {
                      log(addCartProvider.quantity.toString());
                      AddToCartViewModel.get(context).addToCart(
                        productId: productId,
                        token: token,
                        quantity: addCartProvider.quantity,
                      );
                    },
                    icon: Icons.add_circle_outline,
                    iconColor: AppColors.primary,
                    cancelLabel: "Cancel",
                    confirmationLabel: "Add, Now",
                    confirmationColor: AppColors.primary,
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add To Cart"),
                    SizedBox(width: 8),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: const Icon(Icons.favorite_border),
            ),
            ElevatedButton(
              onPressed: () {
                // onAddToCompare(product);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("${product['name']} added to comparison")),
                // );
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: const Icon(Icons.compare_arrows_outlined),
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
        Text(
          '${addCartProvider.quantity}',
          style: const TextStyle(fontSize: 16),
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
