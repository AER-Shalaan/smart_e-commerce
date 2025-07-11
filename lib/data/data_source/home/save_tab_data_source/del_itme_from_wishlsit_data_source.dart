import 'package:dartz/dartz.dart' show Either;
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/add_and_del_response_for_wishlist.dart';

abstract class DelItmeFromWishlsitDataSource {
  Future<Either<Failure, AddAndDelResponseForWishlist>> delProduct({
    required String token,
    required String userId,
    required String itemId,
  });
}
