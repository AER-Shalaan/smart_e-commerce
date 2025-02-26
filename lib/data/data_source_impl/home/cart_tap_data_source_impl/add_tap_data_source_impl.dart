import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/add_to_cart_data_source.dart';

@Injectable(as: AddToCartDataSource)
class AddTapDataSourceImpl extends AddToCartDataSource {
  ApiManger apiManger;
  @factoryMethod
  AddTapDataSourceImpl(this.apiManger);

  @override
  Future<Either<String, String>> addToCart({
    required String productId,
    required String token,
    required int quantity,
  }) async{
   try {
   var response=  await apiManger.postRequestForHme(endPoints: EndPoints.addToCartEndPoint, queryParameters: {"ItemId":productId,"Quantity":quantity},token: token);
   return left(response.data.toString());
   } catch (e) {
     return right(e.toString());
   }
  }
}
