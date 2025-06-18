import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/del_from_cart_data_source.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

@Injectable(as: DelFromCartDataSource)
class DelFromCartDataSourceImpl extends DelFromCartDataSource {
  ApiManger apiManger;

  @factoryMethod
  DelFromCartDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<CartModel>>> removeItemFromCart({
    required String token,
    required String buyerId,
    required String itemId,
  }) async {
    final result = await apiManger.deleteRequest(
      token: token,
      endPoints: EndPoints.removeFromCartEndPoint,
      queryParameters: {"BuyerId": buyerId, "ItemId": itemId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(
        (response.data['value'] as List)
            .map((json) => CartModel.fromJson(json))
            .toList(),
      ),
    );
  }
}
