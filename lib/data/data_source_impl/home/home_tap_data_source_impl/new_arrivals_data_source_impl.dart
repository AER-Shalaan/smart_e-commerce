import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/ProductsModel.dart';

@Injectable(as: NewArrivalsDataSource)
class NewArrivalsDataSourceImpl extends NewArrivalsDataSource {
  ApiManger apiManger;
  @factoryMethod
  NewArrivalsDataSourceImpl(this.apiManger);
  @override
  Future<Either<List<Products>, String>> getNewArrivals({
    required String token,
  }) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.getFilteredProducts,
        token: token,
        queryParameters: {"pageNumber": 1, "pageSize": 25, "newwest": true},
      );
      List<Products> newArrivalsModel =
          ProductsModel.fromJson(response.data).products ?? [];
      return Left(newArrivalsModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
