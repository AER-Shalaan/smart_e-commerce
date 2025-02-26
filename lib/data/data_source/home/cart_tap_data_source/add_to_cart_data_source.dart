import 'package:dartz/dartz.dart';

abstract class AddToCartDataSource {
  Future<Either<String,String>> addToCart({required String productId,required String token,required int quantity});
}