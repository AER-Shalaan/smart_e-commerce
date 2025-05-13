import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class TopRatedDataSource {
  Future<Either<Failure, List<Products>>> getTopRated({
    required String token,
    required int page,
  });
}
