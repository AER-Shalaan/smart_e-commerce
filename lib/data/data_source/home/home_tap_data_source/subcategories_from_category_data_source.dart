import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';

abstract class SubcategoriesFromCategoryDataSource {
  Future<Either<Failure, List<SubCategory>>> getSubCategories({
    required String token,
    required int categoryId
  });
}