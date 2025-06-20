import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

abstract class FilterDataSource {
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
  });
}
