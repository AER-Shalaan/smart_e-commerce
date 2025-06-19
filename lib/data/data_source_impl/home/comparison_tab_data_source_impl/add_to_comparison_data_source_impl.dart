import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/add_to_comparison_data_source.dart';
import 'package:smart_ecommerce/data/models/add_to_comparison_model/add_to_comparison_model.dart';
@Injectable(as: AddToComparisonDataSource)
class AddToComparisonDataSourceImpl implements AddToComparisonDataSource {
  final ApiManger apiManger;

  AddToComparisonDataSourceImpl(this.apiManger);

  @override
  Future<AddToComparisonModel> addItemToComparison({
    required String token,
    required String itemId,
    required String buyerId,
  }) async {
    final response = await apiManger.postRequestForHme(
      token: token,
      endPoints: EndPoints.addToComparisonEndPoint,
      queryParameters: {"ItemId": itemId, "BuyerId": buyerId},
    );
     return response.fold(
      (failure) => throw Exception(failure.message),
      (response) => AddToComparisonModel.fromJson(response.data),
    );
  }
}
