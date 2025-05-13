import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'full_screen_image_gallery.dart';

class CarouselImage extends StatefulWidget {
  final List<String> imageUrls;

  const CarouselImage({super.key, required this.imageUrls});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(widget.imageUrls, context),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = MediaQuery.of(context).size.width;
          double imageHeight = constraints.maxHeight * 0.85;
          double indicatorSize = 5;

          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: imageHeight,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    enlargeCenterPage: true,
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
                              imageHeight,
                              screenWidth,
                            ),
                          )
                          .toList(),
                ),
                const SizedBox(height: 5),
                _buildCarouselIndicator(indicatorSize),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageWithLoader(String url, double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        fit: BoxFit.fill,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
        },
      ),
    );
  }

  Widget _buildCarouselIndicator(double indicatorSize) {
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
            color: _currentIndex == index ? Colors.black : Colors.grey,
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
