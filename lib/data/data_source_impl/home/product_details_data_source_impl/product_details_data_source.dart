import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/product_details_data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/ProductDetailsModel.dart';

@Injectable(as: ProductDetailsDataSource)
class ProductDetailsDataSourceImpl extends ProductDetailsDataSource {
  ApiManger apiManger;
  @factoryMethod
  ProductDetailsDataSourceImpl(this.apiManger);
  @override
  Future<Either<ProductDetailsModel, String>> getProductDetails({
    required String productId,
    required String token,
  }) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.getProductDetailsEndPoint,
        token: token,
        queryParameters: {"id": productId},
      );
      ProductDetailsModel productDetailsModel = ProductDetailsModel.fromJson(
        response.data,
      );
      return Left(productDetailsModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
