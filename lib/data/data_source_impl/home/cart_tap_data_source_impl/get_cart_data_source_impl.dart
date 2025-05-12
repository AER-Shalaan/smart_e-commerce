import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/get_cart_data_source.dart';
import 'package:smart_ecommerce/data/models/cart_model/CartModel.dart';

@Injectable(as: GetCartDataSource)
class GetCartDataSourceImpl extends GetCartDataSource {
  final ApiManger apiManger;

  @factoryMethod
  GetCartDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<CartModel>>> getCart({
    required String token,
    required String userId,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getCartEndPoint,
      token: token,
      queryParameters: {"UserId": userId},
    );

    return result.map((response) {
      return (response.data as List)
          .map((json) => CartModel.fromJson(json))
          .toList();
    });
  }
}
