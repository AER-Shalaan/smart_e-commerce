import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/top_rated_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/ProductsModel.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImpl extends TopRatedDataSource {
  ApiManger apiManger;
  @factoryMethod
  TopRatedDataSourceImpl(this.apiManger);
  @override
  Future<Either<List<Products>, String>> getTopRated({
    required String token,
  }) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.getFilteredProducts,
        token: token,
        queryParameters: {"pageNumber": 1, "pageSize": 25, "minRate": 1},
      );
      List<Products> topRatedModel =
          ProductsModel.fromJson(response.data).products ?? [];
      return Left(topRatedModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
