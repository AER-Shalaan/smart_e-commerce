import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

abstract class NewArrivalsDataSource {
  Future<Either<Failure, List<ProductDetailsModel>>> getNewArrivals({
    required String token,
    required int page,
  });
}
