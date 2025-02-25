import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/widgets/body_details/photos_widgets/tablet/product_photos_tablet.dart';

import 'mobile/product_photos_mobile.dart';
class PhotosWidgetPreview extends StatelessWidget {
  const PhotosWidgetPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.minWidth > 600) {
            return const ProductPhotosTablet();
          } else {
            return const ProductPhotosMobile();
          }
        },
      ),
    );
  }
}
