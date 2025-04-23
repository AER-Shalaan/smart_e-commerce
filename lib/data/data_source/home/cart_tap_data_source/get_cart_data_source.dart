import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/data/models/cart_model/CartModel.dart';

abstract class GetCartDataSource {
  Future<Either<List<CartModel>, String>> getCart({
    required String token,
    required String userId,
  });
}
