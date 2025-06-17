import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class ProductNameDetailsReviewPrice extends StatelessWidget {
  const ProductNameDetailsReviewPrice({super.key, required this.product});
  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    final double price =
        double.tryParse(product.data!.priceOut.toString()) ?? 0.0;
    final double discount =
        double.tryParse(product.data!.discount?.toString() ?? "0") ?? 0.0;
    final double finalPrice = discount > 0 ? price - discount : price;

    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;
    final grey300 = Colors.grey[300]!;
    final grey600 = Colors.grey[600]!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.data!.itemName ?? "",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${finalPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (discount > 0) ...[
                const SizedBox(width: 8),
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffED1010).withAlpha(32),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "-${discount.toStringAsFixed(0)}",
                    style: const TextStyle(
                      color: Color(0xffED1010),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  "Stock: ${product.data!.quantity}",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                Assets.assetsIconsStarIcon,
                height: 19,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 4),
              Text(
                "${(product.rating?.averageRating ?? 0).toStringAsFixed(2)} / 5",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                "(${product.rating!.totalReviews ?? 0} Reviews)",
                style: TextStyle(color: grey600, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: grey300),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                    Assets.assetsImagesSallerImage,
                  ),
                  backgroundColor: Colors.grey[200],
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.data!.sellerName ?? 'Seller',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor,
                        ),
                      ),
                      const Text(
                        "Official Store",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withAlpha(22),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 19,
                      color: Color(0xff0E947A),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: grey300),
          const SizedBox(height: 14),
          Text(
            "Product Description",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Text(
              product.data!.description ?? "",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                color: Colors.black87,
              ),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
