import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/text_styles.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/Categories.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categories,
    required this.color,
  });

  final Categories categories;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      width: isTablet ? 150 : 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: isTablet ? 80 : 60,
              height: isTablet ? 80 : 60,
              color: Colors.white,
              child:
                  (categories.categoryImage == null ||
                          categories.categoryImage!.isEmpty)
                      ? const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      )
                      : Image.network(
                        categories.categoryImage!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                            ),
                      ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categories.categoryName ?? "No name",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.style14Simebold,
          ),
        ],
      ),
    );
  }
}
