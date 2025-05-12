import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/ProductsModel.dart';

@Injectable(as: NewArrivalsDataSource)
class NewArrivalsDataSourceImpl extends NewArrivalsDataSource {
  final ApiManger apiManger;

  @factoryMethod
  NewArrivalsDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<Products>>> getNewArrivals({
    required String token,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {
        "pageNumber": 1,
        "pageSize": 25,
        "newwest": true,
      },
    );

    return result.map((response) {
      return ProductsModel.fromJson(response.data).products ?? [];
    });
  }
}
