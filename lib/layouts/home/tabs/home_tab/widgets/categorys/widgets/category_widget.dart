import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.color, required this.token, required this.userId,
  });

  final String token;
  final Category category;
  final Color color;  
  final String userId;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
         FilterViewModel.getObject(context).getFilteredData(
                    token: token,
                    categoryId: category.categoryID,
                    page: 1,
                  );
          Navigator.pushNamed(
            context,
            Routes.filterViewRouteName,
            arguments: [token, userId],
          );
      } ,
      child: Container(
        width: isTablet ? 150 : 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              color, // ممكن تستخدم theme.colorScheme.primaryContainer مثلا لو عايزها بالكامل من theme
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: isTablet ? 80 : 60,
                height: isTablet ? 80 : 60,
                color: theme.cardColor,
                child:
                    (category.categoryImage == null ||
                            category.categoryImage!.isEmpty)
                        ? Icon(
                          Icons.image_not_supported,
                          color: theme.disabledColor,
                        )
                        : Image.network(
                          Constants.baseUrl + category.categoryImage!,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Icon(
                                Icons.broken_image,
                                color: theme.disabledColor,
                              ),
                        ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.categoryName ?? "No name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimary, // أو أي لون من theme يناسبك
              ),
            ),
          ],
        ),
      ),
    );
  }
}
