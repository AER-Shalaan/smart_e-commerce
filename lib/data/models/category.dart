import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';

class Categorys {
  final String image;
  final Color categoryColor;
  final String label;
  final int index;
  const Categorys({
    required this.index,
    required this.label,
    required this.image,
    required this.categoryColor,
  });
  static const List<Categorys> categoryList = [
    Categorys(
      image: Assets.assetsIconsFoodCategory,
      label: "Foods",
      categoryColor: Color(0xff3A9B7A),
      index: 1,
    ),
    Categorys(
      label: "Gift",
      image: Assets.assetsIconsGiftCategory,
      categoryColor: Color(0xffFE6E4C),
      index: 2,
    ),
    Categorys(
      label: "Fashion",
      image: Assets.assetsIconsFashionCategory,
      categoryColor: Color(0xffFFC120),
      index: 3,
    ),
    Categorys(
      label: "Gadget",
      image: Assets.assetsIconsGadgetCategory,
      categoryColor: Color(0xff9B81E5),
      index: 4,
    ),
    Categorys(
      label: "Computer",
      image: Assets.assetsIconsComputeCategory,
      categoryColor: Color(0xff3A9B7A),
      index: 5,
    ),
  ];
}
