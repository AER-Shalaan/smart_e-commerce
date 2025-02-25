import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/top_rated_data_source.dart';
import 'package:smart_ecommerce/data/models/top_rated_products_model/TopRatedModel.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImpl extends TopRatedDataSource {
  ApiManger apiManger;
  @factoryMethod
  TopRatedDataSourceImpl(this.apiManger);
  @override
  Future<Either<List<TopRatedModel>, String>> getTopRated({
    required String token,
  }) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.topRatedEndPoint,
        token: token,
      );
      List<TopRatedModel> topRatedModel =
          (response.data as List)
              .map((json) => TopRatedModel.fromJson(json))
              .toList();
      return Left(topRatedModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
