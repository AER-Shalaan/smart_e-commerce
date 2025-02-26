import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.descount,
    required this.rate,
    required this.reviewersCount,
    required this.productId,
    required this.token, required this.userId,
  });
  final String productId;
  final String token;
  final String userId;
  final String imagePath;
  final String title;
  final String price;
  final String descount;
  final String rate;
  final String reviewersCount;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      enableFeedback: false,
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsView,
          arguments: [productId, token,userId],
        );
      },
      child: Container(
        width: width >= 600 ? 280 : 240,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "\$ $price",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (descount != "0.0")
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "-$descount%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsIconsStarIcon,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$rate ",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      const Spacer(),
                      Text(
                        "($reviewersCount Reviews)",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
