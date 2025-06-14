import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';

abstract class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<Category> categories;
  CategoriesSuccessState(this.categories);
}

class CategoriesErrorState extends CategoriesState {
  final String message;
  CategoriesErrorState(this.message);
}
