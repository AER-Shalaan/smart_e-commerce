import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/recommended_list_data_souce.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';
import 'package:smart_ecommerce/data/models/product_details_model/recommended_products_model.dart';

@Injectable(as: RecommendedListDataSource)
class RecommendedListDataSourceImpl extends RecommendedListDataSource {
  final ApiManger apiManger;
  @factoryMethod
  RecommendedListDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, ProductsModel>> getRecommendedList({
    required int userId,
  }) async {
    final result = await apiManger.getRecommendedListRequest(
      queryParameters: {"user_id": userId},
    );
    
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProductsModel.fromJson(response.data)));
  }
}
