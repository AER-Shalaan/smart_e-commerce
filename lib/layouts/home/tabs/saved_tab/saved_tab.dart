import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/widgets/build_sved_item.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SavedItemWidgetBuilder(
          products: [
            {
              "imagePath":
                  "https://dlcdnwebimgs.asus.com/gain/26B3DFC8-6783-4FAB-BA61-D1A0AE10ED26/w1000/h732",
              "title": "ASUS ROG Strix G16",
              "price": "1599",
              "discount": "10",
            },
            {
              "imagePath":
                  "https://myxprs.com/cdn/shop/products/sony-playstation-5-slim-570862.png?v=1739461287&width=600",
              "title": "Sony PlayStation 5 Slim",
              "price": "499",
              "discount": "10",
            },
            {
              "imagePath":
                  "https://btech.com/media/catalog/product/cache/56f8cf9a2c80561907973a2223f8877b/3/b/3b194b2082578d0e3f77c6177f0378e30673bd2df098f6d345e81f77d1e1fd71.jpeg",
              "title": "Samsung Galaxy S24 Ultra",
              "price": "1299",
              "discount": "7",
            },
          ],
        ),
      ],
    );
  }
}
