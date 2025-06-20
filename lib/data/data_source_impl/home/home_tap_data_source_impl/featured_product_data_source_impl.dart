import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/featured_product_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

@Injectable(as: FeaturedProductDataSource)
class FeaturedProductDataSourceImpl extends FeaturedProductDataSource {
  final ApiManger apiManger;

  @factoryMethod
  FeaturedProductDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<ProductDetailsModel>>> getFeaturedProducts({
    required String token,
    required int page,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {
        "pageNumber": page,
        "pageSize": 10,
        "mostSold": true,
        "maxRate": 5,
      },
    );

    return result.fold(
      (failure) => Left(failure), 
      (response) => Right(ProductsModel.fromJson(response.data).products ?? []));
  }
}
