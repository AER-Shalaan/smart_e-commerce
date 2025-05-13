import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/Categories.dart';

abstract class CategoriesDataSource {
  Future<Either<Failure, List<Categories>>> getCategories({
    required String token,
  });
}