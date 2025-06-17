import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartModel cartModel;
  final String token, userId;

  const ShoppingCartItem({
    super.key,
    required this.cartModel,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
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
        color: theme.cardColor,
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
                  SizedBox(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.2,
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
                          return Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: theme.disabledColor,
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
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cartModel.categoryName ?? "",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: theme.disabledColor,
                          ),
                        ),
                        Text(
                          '${cartModel.subCategoryName}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Available',
                          style: theme.textTheme.bodyMedium?.copyWith(
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
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
