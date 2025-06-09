import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/recommended_products_model.dart';

abstract class RecommendedListDataSource {
  Future<Either<Failure, RecommendedProductsModel>> getRecommendedList({
    required int userId,
  });

}