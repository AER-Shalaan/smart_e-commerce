import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

class ShoppingCartItem extends StatelessWidget {
  // final ValueChanged<int> onQuantityChanged;
  // final VoidCallback onDelete;
  final CartModel cartModel;
  final String token, userId;
  const ShoppingCartItem({
    super.key,

    // required this.onQuantityChanged,
    // required this.onDelete,
    required this.cartModel,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<String>? data = [cartModel.itemID!, token, userId];
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsView,
          arguments: data,
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image Section
                  SizedBox(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.15,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        "${Constants.baseUrl}${cartModel.imageCover}",
                        fit: BoxFit.contain,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Details Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartModel.itemName ?? "",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cartModel.categoryName ?? "",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        // Text(
                        //   '⭐ ${cartModel.rate.toStringAsFixed(1)}',
                        //   style: GoogleFonts.dmSans(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 14,
                        //   ),
                        // ),
                        Text(
                          '${cartModel.subCategoryName}',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        // Text(
                        //   isAvailable ? 'Available' : 'Out of Stock',
                        //   style: GoogleFonts.dmSans(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 14,
                        //     color: isAvailable ? Colors.green : Colors.red,
                        //   ),
                        // ),
                        Text(
                          'Available',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '\$ ${cartModel.priceOut}',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(width: 5),
                            // Text(
                            //   '\$ ${cartModel}',
                            //   style: GoogleFonts.dmSans(
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 14,
                            //     color: Colors.black,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Actions Section
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(
                  //         Icons.remove_shopping_cart_outlined,
                  //         color: Colors.red,
                  //       ),
                  //       onPressed: onDelete,
                  //     ),
                  //     Row(
                  //       children: [
                  //         IconButton(
                  //           icon: const Icon(Icons.remove_circle_outline),
                  //           onPressed: () {
                  //             if (quantity > 1) {
                  //               onQuantityChanged(quantity - 1);
                  //             }
                  //           },
                  //         ),
                  //         Text('$quantity', style: const TextStyle(fontSize: 16)),
                  //         IconButton(
                  //           icon: const Icon(Icons.add_circle_outline),
                  //           onPressed: () {
                  //             onQuantityChanged(quantity + 1);
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
