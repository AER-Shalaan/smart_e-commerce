import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/top_rated_products_model/TopRatedModel.dart';

class NewArrivalsWidgetBuilder extends StatelessWidget {
  NewArrivalsWidgetBuilder({super.key});
  final List<TopRatedModel> topRatedModel = [];

  @override
  Widget build(BuildContext context) {
    return ProductListBuilder(
      label: "New Arrivals",
      index: 0,
      products: topRatedModel,
      token: "",
    );
  }
}
// [
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/81v90JtbImL._AC_SL1500_.jpg",
//           "title": "Samsung Galaxy S24 Ultra 5G",
//           "price": "1299",
//           "descount": "5",
//           "review": "4.9",
//           "reviewersCount": "102"
//         },
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/71f5Eu5lJSL._AC_SL1500_.jpg",
//           "title": "Apple iPad Pro M3 (11-inch)",
//           "price": "1099",
//           "descount": "8",
//           "review": "4.8",
//           "reviewersCount": "56"
//         },
//         {
//           "imagePath":
//               "https://myxprs.com/cdn/shop/products/sony-playstation-5-slim-570862.png?v=1739461287&width=600",
//           "title": "Sony PlayStation 5 Slim",
//           "price": "499",
//           "descount": "10",
//           "review": "4.7",
//           "reviewersCount": "210"
//         },
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/51yWZxN3vRL._AC_UF1000,1000_QL80_.jpg",
//           "title": "Bose QuietComfort Ultra Headphones",
//           "price": "399",
//           "descount": "12",
//           "review": "4.9",
//           "reviewersCount": "85"
//         },
//         {
//           "imagePath":
//               "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/f91a5813-295d-4043-9d43-7e4f226c1238/NIKE+AIR+ZOOM+PEGASUS+40+PRM.png",
//           "title": "Nike Air Zoom Pegasus 40",
//           "price": "139",
//           "descount": "5",
//           "review": "4.8",
//           "reviewersCount": "143"
//         },
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/51mZTrzrBqL._AC_UF1000,1000_QL80_.jpg",
//           "title": "Amazon Echo Show 10 (3rd Gen)",
//           "price": "249",
//           "descount": "15",
//           "review": "4.7",
//           "reviewersCount": "389"
//         },
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/81w6e+7s1dL._AC_UF350,350_QL80_.jpg",
//           "title": "GoPro Hero 12 Black Action Camera",
//           "price": "449",
//           "descount": "7",
//           "review": "4.9",
//           "reviewersCount": "128"
//         },
//         {
//           "imagePath":
//               "https://cdn11.bigcommerce.com/s-cwps3viz1k/images/stencil/2048x2048/products/1522/3565/levi-s-reg-men-s-trucker-jacket-rinse-7__32108.1633365778.jpg?c=1",
//           "title": "Levi's Trucker Denim Jacket",
//           "price": "89",
//           "descount": "10",
//           "review": "4.7",
//           "reviewersCount": "312"
//         },
//         {
//           "imagePath":
//               "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/84/832564/1.jpg?8073",
//           "title": "Philips Hue Smart Light Starter Kit",
//           "price": "159",
//           "descount": "8",
//           "review": "4.6",
//           "reviewersCount": "223"
//         },
//         {
//           "imagePath":
//               "https://images-cdn.ubuy.com.eg/640665ecb0ff643f7f2a6fd7-dyson-supersonic-hair-dryer-ironfuchsia.jpg",
//           "title": "Dyson Supersonic Hair Dryer",
//           "price": "429",
//           "descount": "12",
//           "review": "4.9",
//           "reviewersCount": "189"
//         },
//         {
//           "imagePath":
//               "https://cdn11.bigcommerce.com/s-8ek7z3h3jn/images/stencil/1280x1280/products/10331/61979/ninja-combi-12-in-1-multi-cooker-oven-and-air-fryer-or-sfp700uk__55822.1726079900.jpg?c=1",
//           "title": "Ninja Foodi 12-in-1 Air Fryer & Cooker",
//           "price": "199",
//           "descount": "10",
//           "review": "4.8",
//           "reviewersCount": "412"
//         }
//       ]