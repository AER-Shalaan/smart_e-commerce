import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

abstract class BestSellerDataSource {
  Future<Either<Failure, List<ProductDetailsModel>>> getMostSelling({
    required String token,
    required int page,
  });
}
