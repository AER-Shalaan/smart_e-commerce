import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/data/models/top_rated_products_model/TopRatedModel.dart';

abstract class TopRatedDataSource {
  Future<Either<List<TopRatedModel>, String>> getTopRated({
    required String token,
  });
}
