import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/product_details_data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

@Injectable(as: ProductDetailsDataSource)
class ProductDetailsDataSourceImpl extends ProductDetailsDataSource {
  final ApiManger apiManger;

  @factoryMethod
  ProductDetailsDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String productId,
    required String token,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getProductDetailsEndPoint,
      token: token,
      queryParameters: {"id": productId},
    );

    return result.map((response) {
      return ProductDetailsModel.fromJson(response.data);
    });
  }
}
