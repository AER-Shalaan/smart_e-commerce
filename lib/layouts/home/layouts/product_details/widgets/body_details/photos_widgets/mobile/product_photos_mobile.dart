import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';

class ProductPhotosMobile extends StatefulWidget {
  const ProductPhotosMobile({super.key, required this.productImages});
  final List<String> productImages;
  @override
  State<ProductPhotosMobile> createState() => _ProductPhotosMobileState();
}

class _ProductPhotosMobileState extends State<ProductPhotosMobile> {
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
        Visibility(
          visible: widget.productImages.isNotEmpty,
          child: CarouselSlider.builder(
            itemCount: widget.productImages.length,
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                "${Constants.baseUrl}${widget.productImages[index]}",
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
            ),
          ),
        ),
        Visibility(
          visible: widget.productImages.isNotEmpty,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "${imageIndex + 1}/${widget.productImages.length} Photo",
              style: GoogleFonts.gupter(
                color: AppColors.secondary,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
