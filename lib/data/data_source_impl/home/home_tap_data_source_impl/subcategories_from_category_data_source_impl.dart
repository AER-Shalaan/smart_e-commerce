import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/subcategories_from_category_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';

@Injectable(as: SubcategoriesFromCategoryDataSource)
class SubcategoriesFromCategoryDataSourceImpl extends SubcategoriesFromCategoryDataSource{
  final ApiManger apiManger;
  @factoryMethod
  SubcategoriesFromCategoryDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, List<SubCategory>>> getSubCategories({required String token, required num categoryId}) async{
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getSubCategoryfromCategoryEndPoint,
      token: token,
      queryParameters: {"categoryId": categoryId},
    );
    return result.map((response) => (response.data as List).map((json) => SubCategory.fromJson(json)).toList());
   
  }
  
}