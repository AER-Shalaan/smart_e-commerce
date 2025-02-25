import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/assets.dart';

class ProductPhotosTablet extends StatefulWidget {
  const ProductPhotosTablet({super.key});

  @override
  State<ProductPhotosTablet> createState() => _ProductPhotosTabletState();
}

class _ProductPhotosTabletState extends State<ProductPhotosTablet> {
  final List<String> productImages = const [
    Assets.assetsImagesWatch,
    Assets.assetsImagesWatch2,
    Assets.assetsImagesWatch3,
    Assets.assetsImagesWatch4,
    Assets.assetsImagesAdv1
  ];

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
            child: Image.asset(
              productImages[imageIndex],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
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
                      child: Image.asset(
                        productImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              itemCount: productImages.length,
            ),
          )
        ],
      ),
    );
  }
}
