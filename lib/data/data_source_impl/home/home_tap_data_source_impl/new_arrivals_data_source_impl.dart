import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

@Injectable(as: NewArrivalsDataSource)
class NewArrivalsDataSourceImpl extends NewArrivalsDataSource {
  final ApiManger apiManger;

  @factoryMethod
  NewArrivalsDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<ProductDetailsModel>>> getNewArrivals({
    required String token,
    required int page,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {"pageNumber": page, "pageSize": 10, "newwest": true},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProductsModel.fromJson(response.data).products ?? []));
  }
}
