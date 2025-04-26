import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisments2/adv_widget2.dart';

class AdvWidgetBuilder2 extends StatelessWidget {
  const AdvWidgetBuilder2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemBuilder:
                (context, index, index2) =>
                    AdvWidget2(imagePath: advImagePath[index]),
            itemCount: advImagePath.length,
            options: CarouselOptions(
              height:
                  MediaQuery.sizeOf(context).width >= 600
                      ? height * 0.28
                      : MediaQuery.sizeOf(context).width >= 450
                      ? height * 0.2
                      : height * 0.18,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              autoPlayInterval: const Duration(seconds: 4),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> advImagePath = [
  Assets.assetsImagesAdv1,
  Assets.assetsImagesAdv4,
  Assets.assetsImagesAdv5,
  Assets.assetsImagesAdv6,
];
