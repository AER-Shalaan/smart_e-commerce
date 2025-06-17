import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';

class ProductPhotosTablet extends StatefulWidget {
  const ProductPhotosTablet({super.key, required this.productImages});
  final List<String> productImages;

  @override
  State<ProductPhotosTablet> createState() => _ProductPhotosTabletState();
}

class _ProductPhotosTabletState extends State<ProductPhotosTablet> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imgHeight = MediaQuery.sizeOf(context).height * 0.4;
    final imgWidth = MediaQuery.sizeOf(context).width * 0.45;

    if (widget.productImages.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library_outlined, size: 58, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              "No product photos",
              style: GoogleFonts.gupter(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.productImages.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() => imageIndex = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: imageIndex == index ? AppColors.primary : Colors.transparent,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(16),
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "${Constants.baseUrl}${widget.productImages[index]}",
                      width: 68,
                      height: 68,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 32,
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
          ),
        ),
        const SizedBox(width: 22),
        // الصورة الرئيسية
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: Container(
            key: ValueKey(widget.productImages[imageIndex]),
            width: imgWidth,
            height: imgHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                "${Constants.baseUrl}${widget.productImages[imageIndex]}",
                fit: BoxFit.contain,
                width: imgWidth,
                height: imgHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[100],
                    height: imgHeight,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2.4),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 64,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${imageIndex + 1} / ${widget.productImages.length} Photo",
              style: GoogleFonts.gupter(
                color: AppColors.secondary,
                fontSize: 21,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
