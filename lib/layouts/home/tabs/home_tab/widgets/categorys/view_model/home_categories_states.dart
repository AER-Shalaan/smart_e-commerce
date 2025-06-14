import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';

abstract class HomeCategoriesState {}

class HomeCategoriesLoadingState extends HomeCategoriesState {}

class HomeCategoriesSuccessState extends HomeCategoriesState {
  final List<Category> categories;
  HomeCategoriesSuccessState(this.categories);
}

class HomeCategoriesErrorState extends HomeCategoriesState {
  final String message;
  HomeCategoriesErrorState(this.message);
}
