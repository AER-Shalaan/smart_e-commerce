import 'package:flutter/material.dart';

import '../../../../../../core/resuebale_componants/product_list_builder.dart';

class TopRatedProductWidgetBuilder extends StatelessWidget {
  const TopRatedProductWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductListBuilder(
      label: "Top Rated Product",
      products: [
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/71rXSVqET9L._AC_SL1500_.jpg",
          "title": "Samsung Galaxy S24 Ultra 5G",
          "price": "1299",
          "descount": "7",
          "review": "4.9",
          "reviewersCount": "482"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/61ZGNyXoMRL._AC_UF1000,1000_QL80_.jpg",
          "title": "Sony Bravia XR 65-inch OLED 4K TV",
          "price": "2199",
          "descount": "10",
          "review": "4.9",
          "reviewersCount": "320"
        },
        {
          "imagePath":
              "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-ipad-pro-12-wificell-spacegray-2021?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1674663709258",
          "title": "iPad Pro M2 (12.9-inch, 2023)",
          "price": "1099",
          "descount": "5",
          "review": "4.8",
          "reviewersCount": "412"
        },
        {
          "imagePath": "https://m.media-amazon.com/images/I/61NYFHe3uEL.jpg",
          "title": "Garmin Fenix 7 Smartwatch",
          "price": "699",
          "descount": "12",
          "review": "4.7",
          "reviewersCount": "289"
        },
        {
          "imagePath":
              "https://assets.breville.com/cdn-cgi/image/width=1300,format=auto/BES878/BES878RVC1BUC1/pdp.jpg?pdp",
          "title": "Breville Barista Pro Espresso Machine",
          "price": "799",
          "descount": "10",
          "review": "4.9",
          "reviewersCount": "318"
        },
        {
          "imagePath":
              "https://www.singular.com.cy/images/detailed/379/Amazon_Kindle_Paperwhite_11th_generation_B095J41W29-854037.jpg",
          "title": "Kindle Paperwhite (11th Gen)",
          "price": "139",
          "descount": "10",
          "review": "4.9",
          "reviewersCount": "498"
        }
      ],
    );
  }
}
