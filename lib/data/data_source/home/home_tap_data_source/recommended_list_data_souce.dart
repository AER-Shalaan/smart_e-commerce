import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/recommended_products_model.dart';

abstract class RecommendedListDataSource {
  Future<Either<Failure, RecommendedProductsModel>> getRecommendedList({
    required int userId,
  });

}