import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/search_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl extends SearchDataSource {
  ApiManger apiManger;
  @factoryMethod
  SearchDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, ProductsModel>> search({
    required String token,
    required String query,
    required String userId,
    required int page,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {
        "user_id": userId,
        "searchQuery": query,
        "pageNumber": page,
        "pageSize": 10,
      },
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProductsModel.fromJson(response.data)),
    );
  }
}
