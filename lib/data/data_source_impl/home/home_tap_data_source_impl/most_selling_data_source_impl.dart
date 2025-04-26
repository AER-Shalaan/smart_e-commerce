import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/best_seller_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/ProductsModel.dart';

@Injectable(as: BestSellerDataSource)
class MostSellingDataSourceImpl extends BestSellerDataSource {
  ApiManger apiManger;
  @factoryMethod
  MostSellingDataSourceImpl(this.apiManger);
  @override
  Future<Either<List<Products>, String>> getMostSelling({
    required String token,
  }) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.getFilteredProducts,
        token: token,
        queryParameters: {"pageNumber": 1, "pageSize": 25, "mostSold": true},
      );
      List<Products> mostSellingModel =
          ProductsModel.fromJson(response.data).products ?? [];
      return Left(mostSellingModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
