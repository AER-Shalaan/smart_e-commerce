import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/assets.dart';

class ProductNameDetailsReviewPrice extends StatelessWidget {
  const ProductNameDetailsReviewPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Apple Watch Pro",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 26),
            ),
            const Row(
              children: [
                Text(
                  "\$ 1100",
                  style: TextStyle(color: Color(0xff808080), fontSize: 16),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "-10%",
                  style: TextStyle(color: Color(0xffED1010), fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsIconsStarIcon),
                Text(
                  "4.9  86 Reviews",
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
                    "Stock: 50",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage(Assets.assetsImagesSallerImage),
                    backgroundColor: Colors.grey[300],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop Larson Electronic",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondary),
                      ),
                      Text("Official Store",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary)),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Product Description",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('''
The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. 

The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. 
''', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16)),
            Divider(
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Text(
                  "Review (86)",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(Assets.assetsIconsStarIcon)),
                Text(
                  "4.9",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
