import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';

abstract class SubcategoriesFromCategoryStates {}

class SubcategoriesFromCategoryLoadingState extends SubcategoriesFromCategoryStates {}

class SubcategoriesFromCategorySuccessState extends SubcategoriesFromCategoryStates {
  final List<SubCategory> subCategories;
  SubcategoriesFromCategorySuccessState(this.subCategories);
}

class SubcategoriesFromCategoryErrorState extends SubcategoriesFromCategoryStates {
  final String message;
  SubcategoriesFromCategoryErrorState(this.message);
}
