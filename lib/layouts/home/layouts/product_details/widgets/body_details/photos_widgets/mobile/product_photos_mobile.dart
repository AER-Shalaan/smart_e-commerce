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
    final imgHeight = MediaQuery.sizeOf(context).height * 0.36;

    return Column(
      children: [
        if (widget.productImages.isNotEmpty)
          CarouselSlider.builder(
            itemCount: widget.productImages.length,
            itemBuilder: (context, index, realIndex) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: Container(
                  key: ValueKey(widget.productImages[index]),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(22),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "${Constants.baseUrl}${widget.productImages[index]}",
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: imgHeight,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[100],
                          height: imgHeight,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2.2),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          height: imgHeight,
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 54,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: imgHeight + 16,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  imageIndex = index;
                });
              },
            ),
          ),
        if (widget.productImages.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              "${imageIndex + 1} / ${widget.productImages.length} Photo",
              style: GoogleFonts.gupter(
                color: AppColors.secondary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ),
        if (widget.productImages.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_library_outlined, size: 54, color: Colors.grey[400]),
                const SizedBox(height: 8),
                Text(
                  "No product photos",
                  style: GoogleFonts.gupter(
                    color: Colors.grey[600],
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
