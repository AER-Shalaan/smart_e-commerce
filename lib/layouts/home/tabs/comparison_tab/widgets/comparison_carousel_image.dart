import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/widgets/comparison_full_screen_gallery.dart';

class ComparisonCarouselImage extends StatefulWidget {
  final List<String> imageUrls;

  const ComparisonCarouselImage({super.key, required this.imageUrls});

  @override
  State<ComparisonCarouselImage> createState() =>
      _ComparisonCarouselImageState();
}

class _ComparisonCarouselImageState extends State<ComparisonCarouselImage> {
  int _current = 0;

  List<String> get validUrls {
    return widget.imageUrls
        .where((url) => url.isNotEmpty)
        .map((url) => url.startsWith('http') ? url : Constants.baseUrl + url)
        .toList();
  }

  void _next() {
    setState(() {
      _current = (_current + 1) % validUrls.length;
    });
  }

  void _prev() {
    setState(() {
      _current = (_current - 1 + validUrls.length) % validUrls.length;
    });
  }

  void _showFullScreenGallery(BuildContext context) {
    if (validUrls.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => ComparisonFullScreenGallery(
              imageUrls: validUrls,
              initialIndex: _current,
            ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imgs = validUrls;
    if (imgs.isEmpty) {
      return Icon(
        Icons.broken_image,
        size: 46,
        color: Colors.grey.shade400,
      ); // كبر الحجم هنا كمان
    }
    return GestureDetector(
      onTap: () => _showFullScreenGallery(context),
      child: SizedBox(
        width: 90, // كبر الحجم هنا
        height: 68, // وكمان هنا
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imgs[_current],
                width: 90,
                height: 68,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) =>
                        Icon(Icons.broken_image, color: Colors.grey, size: 38),
              ),
            ),
            if (imgs.length > 1)
              Positioned(
                left: 2,
                child: GestureDetector(
                  onTap: _prev,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black26,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (imgs.length > 1)
              Positioned(
                right: 2,
                child: GestureDetector(
                  onTap: _next,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black26,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
