import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/filter_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

@Injectable(as: FilterDataSource)
class FilterDataSourceImpl extends FilterDataSource {
  ApiManger apiManger;
  @factoryMethod
  FilterDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, ProductsModel>> getFilteredData({
    required String token,
    required int? categoryId,
    required int? subCategoryId,
    required double? maxPrice,
    required double? minPrice,
    required int ?rate,
    required bool?mostViewed,
    required bool?newwest,
    required bool?mostSold,
    required int page,
  }) async {
    var result = await apiManger.getRequest(
      endPoints: EndPoints.getFilteredProducts,
      token: token,
      queryParameters: {
        "categry": categoryId,
        "subCategry": subCategoryId,
        "mostViewed":mostViewed,
        "newwest":newwest,
        "mostSold":mostSold,
        "maxPrice": maxPrice,
        "minPrice": minPrice,
        "minRate": rate,
        "pageNumber":page,
      },
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProductsModel.fromJson(response.data)),
    );
  }
}
