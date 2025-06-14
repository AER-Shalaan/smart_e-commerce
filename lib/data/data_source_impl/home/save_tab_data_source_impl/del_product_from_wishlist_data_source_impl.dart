import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/del_itme_from_wishlsit_data_source.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/add_and_del_response_for_wishlist.dart';

@Injectable(as: DelItmeFromWishlsitDataSource)
class DelProductFromWishlistDataSourceImpl
    extends DelItmeFromWishlsitDataSource {
  ApiManger apiManger;

  @factoryMethod
  DelProductFromWishlistDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, AddAndDelResponseForWishlist>> delProduct({
    required String token,
    required String userId,
    required String itemId,
  }) async {
    final result = await apiManger.deleteRequest(
      token: token,
      endPoints: EndPoints.removeFromWhislistEndPoint,
      queryParameters: {"BuyerId": userId, "ItemId": itemId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AddAndDelResponseForWishlist.fromJson(response.data)),
    );
  }
}
