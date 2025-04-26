import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/constants.dart';

class ProductPhotosTablet extends StatefulWidget {
  const ProductPhotosTablet({super.key, required this.productImages});
  final List<String> productImages;
  @override
  State<ProductPhotosTablet> createState() => _ProductPhotosTabletState();
}

class _ProductPhotosTabletState extends State<ProductPhotosTablet> {
  late int imageIndex;
  @override
  void initState() {
    super.initState();
    imageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              "${Constants.baseUrl}${widget.productImages[imageIndex]}",
              fit: BoxFit.contain,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index != imageIndex) {
                  return GestureDetector(
                    onTap: () {
                      imageIndex = index;
                      setState(() {});
                    },
                    child: Expanded(
                      child: Image.network(
                        widget.productImages[index],
                        fit: BoxFit.contain,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              itemCount: widget.productImages.length,
            ),
          ),
        ],
      ),
    );
  }
}
