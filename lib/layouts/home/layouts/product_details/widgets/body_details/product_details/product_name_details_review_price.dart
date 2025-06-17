import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';

class ProductNameDetailsReviewPrice extends StatelessWidget {
  const ProductNameDetailsReviewPrice({super.key, required this.productData});
  final ProductsData productData;

  @override
  Widget build(BuildContext context) {
    final double price =
        double.tryParse(productData.priceOut.toString()) ?? 0.0;
    final double discount =
        double.tryParse(productData.discount?.toString() ?? "0") ?? 0.0;
    final double finalPrice = (discount > 0) ? price - discount : price;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productData.itemName ?? "",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.bold,
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
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (discount > 0) ...[
                const SizedBox(width: 8),
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 6),
                // مربع الخصم
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
                  color: AppColors.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  "Stock: ${productData.quantity}",
                  style: TextStyle(
                    color: AppColors.primary,
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
              SvgPicture.asset(Assets.assetsIconsStarIcon, height: 19),
              const SizedBox(width: 4),
              Text(
                "${productData.rate}",
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                "(${productData.viewCount} Reviews)",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: Colors.grey[300]),
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
                        productData.sellerName ?? 'Seller',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,
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
                    color: AppColors.primary.withAlpha(22),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 19,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 14),
          Text(
            "Product Description",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Text(
              productData.description ?? "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
