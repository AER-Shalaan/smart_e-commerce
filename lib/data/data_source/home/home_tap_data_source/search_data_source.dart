import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

abstract class SearchDataSource {
  Future<Either<Failure, ProductsModel>> search({
    required String token,
    required String query,
    required String userId,
    required int page,
  });
}
