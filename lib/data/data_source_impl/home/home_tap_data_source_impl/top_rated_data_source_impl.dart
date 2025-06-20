import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/top_rated_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImpl extends TopRatedDataSource {
  final ApiManger apiManger;

  @factoryMethod
  TopRatedDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<ProductDetailsModel>>> getTopRated({
    required String token,
    required int page,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {"pageNumber": page, "pageSize": 10, "maxRate": 5},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProductsModel.fromJson(response.data).products ?? []),
    );
  }
}
