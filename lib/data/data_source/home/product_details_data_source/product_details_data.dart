import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/data/models/product_details_model/ProductDetailsModel.dart';

abstract class ProductDetailsDataSource {
  Future<Either<ProductDetailsModel, String>> getProductDetails({
    required String productId,
    required String token,
  });
}
