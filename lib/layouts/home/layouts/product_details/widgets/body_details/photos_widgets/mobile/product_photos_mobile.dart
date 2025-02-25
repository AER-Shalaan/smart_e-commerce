import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/assets.dart';

class ProductPhotosMobile extends StatefulWidget {
  const ProductPhotosMobile({super.key});

  @override
  State<ProductPhotosMobile> createState() => _ProductPhotosMobileState();
}

class _ProductPhotosMobileState extends State<ProductPhotosMobile> {
  final List<String> productImages = const [
    Assets.assetsImagesWatch,
    Assets.assetsImagesWatch2,
    Assets.assetsImagesWatch3,
    Assets.assetsImagesWatch4,
  ];

  late int imageIndex;
  @override
  void initState() {
    super.initState();
    imageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: productImages.length,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                productImages[index],
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height * 0.38,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                imageIndex = index;
                setState(() {});
              },
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "${imageIndex + 1}/${productImages.length} Photo",
            style: GoogleFonts.gupter(color: AppColors.secondary, fontSize: 20),
          ),
        )
      ],
    );
  }
}
