import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

abstract class UpdateCartDataSource {
  Future<Either<Failure, List<CartModel>>> updateCartItem({
    required String token,
    required String buyerId,
    required String itemId,
    required int quantity,
  });
}
