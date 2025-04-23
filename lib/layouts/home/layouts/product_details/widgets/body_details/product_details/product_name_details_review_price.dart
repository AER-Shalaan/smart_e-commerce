import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';

class ProductNameDetailsReviewPrice extends StatelessWidget {
  const ProductNameDetailsReviewPrice({super.key, required this.productData});
  final ProductsData productData;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              productData.itemName ?? "",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 26),
            ),
            Row(
              children: [
                Text(
                  "\$ ${productData.priceOut}",
                  style: TextStyle(color: Color(0xff808080), fontSize: 16),
                ),
                SizedBox(width: 4),
                Text(
                  "-${productData.discount}",
                  style: TextStyle(color: Color(0xffED1010), fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsIconsStarIcon),
                Text(
                  "${productData.rate}  ${productData.viewCount} Reviews",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Container(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Stock: ${productData.quantity}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey[300]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      Assets.assetsImagesSallerImage,
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productData.sellerName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.secondary,
                        ),
                      ),
                      Text(
                        "Official Store",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 20),
            Text(
              "Product Description",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productData.description ?? "",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            Divider(color: Colors.grey[300]),
            Row(
              children: [
                Text(
                  "Review (${productData.viewCount})",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(Assets.assetsIconsStarIcon),
                ),
                Text(
                  "${productData.rate}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
