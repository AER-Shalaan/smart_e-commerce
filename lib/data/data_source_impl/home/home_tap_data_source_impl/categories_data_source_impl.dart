import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/categories_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource {
  final ApiManger apiManger;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<Category>>> getCategories({
    required String token,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getAllCategoryEndPoint,
      token: token,
    );

    return result.map(
      (response) => (response.data as List).map((json) => Category.fromJson(json)).toList(),
    );
  }
}
