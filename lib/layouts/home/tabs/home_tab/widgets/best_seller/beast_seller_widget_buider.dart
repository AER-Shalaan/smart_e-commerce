import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/top_rated_products_model/TopRatedModel.dart';

class BeastSellerWidgetBuider extends StatelessWidget {
  BeastSellerWidgetBuider({super.key});
  final List<TopRatedModel> topRatedModel = [];
  @override
  Widget build(BuildContext context) {
    return ProductListBuilder(
      label: "Beast Seller",
      index: 0,
      products: topRatedModel,
      token: "", userId: '',
    );
  }
}
// [
//         {
//           "imagePath":
//               "https://tdawi.com/media/catalog/product/cache/c02fd180406f0a5f799ad7095a14ddcd/5/1/51fakztolgl._ac_sl1200_.jpg",
//           "title": "Dyson Airwrap Multi-Styler",
//           "price": "599",
//           "descount": "10",
//           "review": "4.8",
//           "reviewersCount": "750"
//         },
//         {
//           "imagePath":
//               "https://i5.walmartimages.com/seo/CeraVe-Hydrating-Cleanser-473-ml_2f135613-5334-47d3-8afa-0994b3ebf040.5f1f5bb43b03518241769cbc9c5eb0ea.jpeg",
//           "title": "CeraVe Hydrating Facial Cleanser",
//           "price": "15",
//           "descount": "5",
//           "review": "4.9",
//           "reviewersCount": "1200"
//         },
//         {
//           "imagePath":
//               "https://tdawi.com/media/catalog/product/cache/fdd7f6d4237a0ee42af30840ddc04b47/7/1/715lkf0qqal._sl1500_.jpg",
//           "title": "Revlon One-Step Hair Dryer and Volumizer",
//           "price": "59",
//           "descount": "20",
//           "review": "4.7",
//           "reviewersCount": "680"
//         },
//         {
//           "imagePath":
//               "https://tv-it.com/storage/shada/playstation5/playstation5-pro-p1.webp",
//           "title": "Sony PlayStation 5 Pro Console",
//           "price": "670",
//           "descount": "5",
//           "review": "4.9",
//           "reviewersCount": "1500"
//         },
//         {
//           "imagePath":
//               "https://m.media-amazon.com/images/I/41tRswpVI1L._SL500_.jpg",
//           "title": "KitchenAid Artisan Stand Mixer",
//           "price": "449",
//           "descount": "15",
//           "review": "4.9",
//           "reviewersCount": "850"
//         },
//         {
//           "imagePath":
//               "https://images-cdn.ubuy.com.eg/65281c9131c2150b021da398-l-039-oreal-paris-true-match-liquid.jpg",
//           "title": "L'Oreal Paris True Match Foundation",
//           "price": "12",
//           "descount": "10",
//           "review": "4.8",
//           "reviewersCount": "920"
//         },
//         {
//           "imagePath":
//               "https://www.ubuy.com.eg/productimg/?image=aHR0cHM6Ly90YXJnZXQuc2NlbmU3LmNvbS9pcy9pbWFnZS9UYXJnZXQvR1VFU1RfNjI0OTAxZGQtMDg4Ni00NjEzLWFkYjYtYzBlNDViYzUzM2NhP3dpZD04MDAmYW1wO2hlaT04MDAmYW1wO3FsdD04MCZhbXA7Zm10PXdlYnA.jpg",
//           "title": "Ninja Air Fryer Max XL",
//           "price": "149",
//           "descount": "12",
//           "review": "4.9",
//           "reviewersCount": "1300"
//         },
//         {
//           "imagePath":
//               "https://trojanstores.com/wp-content/uploads/2022/09/1-1.webp",
//           "title": "Apple AirPods Pro (2nd Gen)",
//           "price": "249",
//           "descount": "10",
//           "review": "4.9",
//           "reviewersCount": "2100"
//         },
//         {
//           "imagePath":
//               "https://btech.com/media/catalog/product/cache/56f8cf9a2c80561907973a2223f8877b/3/b/3b194b2082578d0e3f77c6177f0378e30673bd2df098f6d345e81f77d1e1fd71.jpeg",
//           "title": "Samsung Galaxy S24 Ultra 5G",
//           "price": "1299",
//           "descount": "7",
//           "review": "4.9",
//           "reviewersCount": "482"
//         },
//       ]