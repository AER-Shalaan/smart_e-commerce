import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class NewArrivalsDataSource {
  Future<Either<List<Products>, String>> getNewArrivals({
    required String token,
  });
}
