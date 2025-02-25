import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/data/models/category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categorys});
  final Categorys categorys;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.07,
          width: MediaQuery.sizeOf(context).height * 0.07,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: categorys.categoryColor.withOpacity(0.3),
          ),
          child: SvgPicture.asset(
            categorys.image,
            colorFilter: ColorFilter.mode(
              categorys.categoryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          categorys.label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
