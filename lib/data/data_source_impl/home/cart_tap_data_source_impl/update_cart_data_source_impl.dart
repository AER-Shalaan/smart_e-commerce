import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/update_cart_data_source.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

@Injectable(as: UpdateCartDataSource)
class UpdateCartDataSourceImpl implements UpdateCartDataSource {
  final ApiManger apiManager;
  @factoryMethod
  UpdateCartDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failure, List<CartModel>>> updateCartItem({
    required String token,
    required String buyerId,
    required String itemId,
    required int quantity,
  }) async {
    final result = await apiManager.putRequest(
      token: token,
      endPoints: EndPoints.updateCartEndPoint,
      queryParameters: {
        "BuyerId": buyerId,
        "ItemId": itemId,
        "Quantity": quantity,
      },
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
