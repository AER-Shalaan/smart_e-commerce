import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartItem extends StatelessWidget {
  final String image;
  final String name;
  final double discountedPrice;
  final int price;
  final int quantity;
  final double rating;
  final String category;
  final bool isAvailable;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  const ShoppingCartItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.quantity,
    required this.rating,
    required this.category,
    required this.isAvailable,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    width: screenWidth * 0.2, // Responsive width
                    height: screenWidth * 0.15, // Responsive height
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                // Details Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        category,
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '⭐ ${rating.toStringAsFixed(1)}',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        isAvailable ? 'Available' : 'Out of Stock',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: isAvailable ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$ $price',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '\$ $discountedPrice',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Actions Section
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove_shopping_cart_outlined,
                        color: Colors.red,
                      ),
                      onPressed: onDelete,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            if (quantity > 1) {
                              onQuantityChanged(quantity - 1);
                            }
                          },
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            onQuantityChanged(quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
