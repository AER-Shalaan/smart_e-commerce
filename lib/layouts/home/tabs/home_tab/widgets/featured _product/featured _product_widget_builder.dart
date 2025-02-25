import 'package:flutter/material.dart';
import '../../../../../../core/resuebale_componants/product_list_builder.dart';

class FeaturedProductWidgetBuilder extends StatelessWidget {
  const FeaturedProductWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductListBuilder(
      label: "Featured Product",
      products: [
        {
          "imagePath": "https://m.media-amazon.com/images/I/61tOjWVRaKL.jpg",
          "title": "Samsung 55-Inch 4K Smart TV",
          "price": "799",
          "descount": "12",
          "review": "4.6",
          "reviewersCount": "542"
        },
        {
          "imagePath": "https://m.media-amazon.com/images/I/517RFNhcMJL.jpg",
          "title": "Dyson V15 Detect Cordless Vacuum",
          "price": "649",
          "descount": "10",
          "review": "4.8",
          "reviewersCount": "312"
        },
        {
          "imagePath": "https://m.media-amazon.com/images/I/51aXvjzcukL.jpg",
          "title": "Sony WH-1000XM5 Noise Cancelling Headphones",
          "price": "299",
          "descount": "15",
          "review": "4.9",
          "reviewersCount": "814"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/41l9ogtcd2L._AC_.jpg",
          "title": "Nike Air Max 270 Running Shoes",
          "price": "129",
          "descount": "5",
          "review": "4.7",
          "reviewersCount": "289"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/71o6YeJs+wL._AC_SL1500_.jpg",
          "title": "Instant Pot Duo 7-in-1 Electric Pressure Cooker",
          "price": "89",
          "descount": "18",
          "review": "4.8",
          "reviewersCount": "1220"
        },
        {
          "imagePath":
              "https://fossil.scene7.com/is/image/FossilPartners/FTW4059_main?\$sfcc_fos_large\$",
          "title": "Fossil Gen 6 Smartwatch",
          "price": "199",
          "descount": "20",
          "review": "4.5",
          "reviewersCount": "487"
        },
        {
          "imagePath":
              "https://www.andersonswanganui.co.nz/user/images/95.jpg?t=2007071308",
          "title": "Levi's Men's 511 Slim Fit Jeans",
          "price": "59",
          "descount": "10",
          "review": "4.6",
          "reviewersCount": "654"
        },
        {
          "imagePath":
              "https://f.nooncdn.com/p/pnsku/N53437293A/45/_/1715699364/29988c25-9aa4-41ad-b48e-cf8c14b0add2.jpg?format=jpg&width=original",
          "title": "Apple Watch Series 9 GPS 45mm",
          "price": "429",
          "descount": "5",
          "review": "4.9",
          "reviewersCount": "1324"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/715ar5ndK4L._AC_SL1500_.jpg",
          "title": "Keurig K-Slim Coffee Maker",
          "price": "89",
          "descount": "15",
          "review": "4.7",
          "reviewersCount": "982"
        },
        {
          "imagePath":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJnRYCwPPGX68PZ3Jidb6sj5MFz5-MUG8Qiw&s",
          "title": "Canon EOS Rebel T7 DSLR Camera",
          "price": "479",
          "descount": "10",
          "review": "4.8",
          "reviewersCount": "675"
        },
        {
          "imagePath":
              "https://m.media-amazon.com/images/I/71Rw-vBKy0L._AC_UF1000,1000_QL80_.jpg",
          "title": "Amazon Basics Adjustable Dumbbells Set",
          "price": "149",
          "descount": "12",
          "review": "4.7",
          "reviewersCount": "320"
        },
        {
          "imagePath":
              "https://images.philips.com/is/image/philipsconsumer/ec6a347ab35f45c894abadba01218d35?wid=700&hei=700&\$pnglarge\$",
          "title": "Philips Sonicare Electric Toothbrush",
          "price": "89",
          "descount": "10",
          "review": "4.8",
          "reviewersCount": "746"
        }
      ],
    );
  }
}
