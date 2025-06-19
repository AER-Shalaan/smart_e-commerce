import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'full_screen_image_gallery.dart';

class CarouselImage extends StatefulWidget {
  final List<String> imageUrls;
  final double width;
  final double height;

  const CarouselImage({
    super.key,
    required this.imageUrls,
    this.width = 120,
    this.height = 60,
  });

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _showFullScreenImage(widget.imageUrls, context),
      child: SizedBox(
        width: widget.width,
        height: widget.height + 14, // Extra for indicator
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: widget.height,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items:
                  widget.imageUrls
                      .map(
                        (url) => _buildImageWithLoader(
                          url,
                          widget.height,
                          widget.width,
                          theme.cardColor,
                          theme.dividerColor,
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 4),
            _buildCarouselIndicator(5, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithLoader(
    String url,
    double height,
    double width,
    Color bg,
    Color border,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          Constants.baseUrl + url,
          fit: BoxFit.cover,
          width: width,
          height: height,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.broken_image,
              size: 50,
              color: Theme.of(context).disabledColor,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator(double indicatorSize, ThemeData theme) {
    final activeColor = theme.colorScheme.primary;
    final inactiveColor = theme.disabledColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.imageUrls.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: _currentIndex == index ? indicatorSize * 1.4 : indicatorSize,
          height: _currentIndex == index ? indicatorSize * 1.4 : indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }

  void _showFullScreenImage(List<String> imageUrls, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageGallery(imageUrls: imageUrls),
      ),
    );
  }
}
