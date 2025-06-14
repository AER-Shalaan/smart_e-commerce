import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/onBording/widgets/page_view_item.dart';

import '../../../core/utils/assets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,

      children: const [
        PageViewItem(
          imagePath: Assets.assetsImagesOnBoarding1,
          title: "Welcome!",
          description:
              "Welcome to Inspire Market! Shop for groceries, gadgets, and more with seamless checkout and fast delivery. Start your shopping adventure now!",
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        PageViewItem(
          imagePath: Assets.assetsImagesOnBoarding2,
          title: "Easy Shopping",
          description:
              "Inspire Market provides discounts on electronics and everyday essentials, offering a convenient shopping experience for customers.",
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        PageViewItem(
          imagePath: Assets.assetsImagesOnBoarding3,
          title: "Your Market",
          description:
              "Inspire Market simplifies shopping with a wide product range, price comparisons, and doorstep delivery for a convenient and enjoyable shopping experience.",
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
