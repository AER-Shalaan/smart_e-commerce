import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';

abstract class AddToCartDataSource {
  Future<Either<Failure, String>> addToCart({
    required String productId,
    required String token,
    required int quantity,
    required String userId,
  });
}
