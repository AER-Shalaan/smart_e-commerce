import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisements/adv_widget.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisements/provider/adv_provider.dart';

class AdvWidgetBuilder extends StatelessWidget {
  const AdvWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    AdvProvider advProvider = Provider.of<AdvProvider>(context);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width >= 600
              ? MediaQuery.sizeOf(context).width * 1.2
              : MediaQuery.sizeOf(context).width * 0.8,
          child: CarouselSlider.builder(
              carouselController: CarouselSliderController(),
              itemBuilder: (context, index, index2) {
                return AdvWidget(imagePath: advImagePath[index]);
              },
              itemCount: advImagePath.length,
              options: CarouselOptions(
                autoPlayCurve: Curves.fastOutSlowIn,
                height: MediaQuery.sizeOf(context).width >= 600
                    ? height * 0.28
                    : MediaQuery.sizeOf(context).width >= 450
                        ? height * 0.2
                        : height * 0.17,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  advProvider.changeAdvCurrentIndex(index);
                },
              )),
        ),
        DotsIndicator(
          dotsCount: advImagePath.length,
          position: advProvider.currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: Theme.of(context).colorScheme.primary,
            activeShape: const CircleBorder(),
            activeSize: const Size(10.0, 10.0),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            shape: const CircleBorder(),
            size: const Size(10.0, 10),
          ),
        )
      ],
    );
  }
}

List<String> advImagePath = [
  Assets.assetsImagesAdv1,
  Assets.assetsImagesAdv4,
  Assets.assetsImagesAdv5,
  Assets.assetsImagesAdv6,
];
// CarouselSlider.builder(
//           itemBuilder: (context, index, index2) =>
//               AdvWidget(imagePath: advImagePath[index]),
//           itemCount: advImagePath.length,
//           options: CarouselOptions(
//             height: MediaQuery.sizeOf(context).width >= 600
//                 ? height * 0.28
//                 : MediaQuery.sizeOf(context).width >= 450
//                     ? height * 0.2
//                     : height * 0.17,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             autoPlayInterval: const Duration(seconds: 4),
//           ),
//         ),