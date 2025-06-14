import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/get_user_wishlist_data_source.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_response_model.dart';

@Injectable(as: GetUserWishlistDataSource)
class GetUserWishlistDataSourceImpl extends GetUserWishlistDataSource {
  ApiManger apiManger;
  @factoryMethod
  GetUserWishlistDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, WishlistResponseModel>> getUserWishlist({
    required String token,
    required String userId,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getWhislistEndPoint,
      token: token,
      queryParameters: {"UserId": userId},
    );

    return result.fold(
      (failure)=> Left(failure),
      (response) => Right(WishlistResponseModel.fromJson(response.data)),
    );
  }
}
