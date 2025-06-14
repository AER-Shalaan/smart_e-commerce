import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/add_to_cart_data_source.dart';

@Injectable(as: AddToCartDataSource)
class AddTapDataSourceImpl extends AddToCartDataSource {
  final ApiManger apiManger;

  @factoryMethod
  AddTapDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, String>> addToCart({
    required String productId,
    required String token,
    required int quantity,
    required String userId,
  }) async {
    final result = await apiManger.postRequestForHme(
      endPoints: EndPoints.addToCartEndPoint,
      queryParameters: {
        "ItemId": productId,
        "Quantity": quantity,
        "BuyerId": userId,
      },
      token: token,
      body: {}, // لو الـ API بيحتاج Body فارغ
    );

    return result.map((response) => response.data.toString());
  }
}
