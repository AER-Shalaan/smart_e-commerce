import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_response_model.dart';

abstract class GetUserWishlistDataSource {
  Future<Either<Failure, WishlistResponseModel>> getUserWishlist({
    required String token,
    required String userId,
  });
}