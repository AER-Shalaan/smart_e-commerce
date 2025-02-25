import 'package:flutter/material.dart';

import '../../../../../../core/resuebale_componants/product_list_builder.dart';

class RecommendedWidgetBuilder extends StatelessWidget {
  const RecommendedWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductListBuilder(
      label: "Recommended for you",
      products: [
        {
          "imagePath":
              "https://dlcdnwebimgs.asus.com/gain/26B3DFC8-6783-4FAB-BA61-D1A0AE10ED26/w1000/h732",
          "title": "ASUS ROG Strix G16 (2024)",
          "price": "1599",
          "descount": "10",
          "review": "4.8",
          "reviewersCount": "385"
        },
        {
          "imagePath": "https://m.media-amazon.com/images/I/611hK2U2rnL.jpg",
          "title": "Apple MacBook Pro M3 (16-inch)",
          "price": "2499",
          "descount": "5",
          "review": "4.9",
          "reviewersCount": "986"
        },
        {
          "imagePath": "https://m.media-amazon.com/images/I/61Bue23QpZL.jpg",
          "title": "Razer BlackShark V2 Gaming Headset",
          "price": "99",
          "descount": "15",
          "review": "4.7",
          "reviewersCount": "34"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/61ni3t1ryQL._AC_UF894,1000_QL80_.jpg",
          "title": "Logitech MX Master 3S Wireless Mouse",
          "price": "89",
          "descount": "10",
          "review": "4.8",
          "reviewersCount": "157"
        },
      ],
    );
  }
}
