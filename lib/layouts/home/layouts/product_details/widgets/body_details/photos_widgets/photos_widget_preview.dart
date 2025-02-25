import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/mobile/product_photos_mobile.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/tablet/product_photos_tablet.dart';

class PhotosWidgetPreview extends StatelessWidget {
  const PhotosWidgetPreview({super.key, required this.productImages});
  final List<String> productImages;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.minWidth > 600) {
            return ProductPhotosTablet(
              productImages: productImages,
            );
          } else {
            return ProductPhotosMobile(
              productImages: productImages,
            );
          }
        },
      ),
    );
  }
}
