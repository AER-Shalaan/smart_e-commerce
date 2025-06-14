import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/add_itme_to_wishlsit_data_source.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/add_and_del_response_for_wishlist.dart';

@Injectable(as: AddItmeToWishlistDataSource)
class AddProductToWishlistDataSourceImpl extends AddItmeToWishlistDataSource {
  final ApiManger apiManger;

  @factoryMethod
  AddProductToWishlistDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, AddAndDelResponseForWishlist>> addProduct({
    required String token,
    required String userId,
    required String itemId,
  }) async {
    final result = await apiManger.postRequestForHme(
      endPoints: EndPoints.addToWhislistEndPoint,
      token: token,
      queryParameters: {"BuyerId": userId, "ItemId": itemId},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AddAndDelResponseForWishlist.fromJson(response.data)),
    );
  }
}
