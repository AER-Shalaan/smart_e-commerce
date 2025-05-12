import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/cart_model/CartModel.dart';

abstract class GetCartDataSource {
  Future<Either<Failure, List<CartModel>>> getCart({
    required String token,
    required String userId,
  });
}
