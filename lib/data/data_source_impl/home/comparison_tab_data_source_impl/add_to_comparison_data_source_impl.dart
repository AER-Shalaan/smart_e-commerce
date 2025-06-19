import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/add_to_comparison_data_source.dart';
@Injectable(as: AddToComparisonDataSource)
class AddToComparisonDataSourceImpl implements AddToComparisonDataSource {
  final ApiManger apiManger;
  @factoryMethod
  AddToComparisonDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, String>> addItemToComparison({
    required String token,
    required String itemId,
    required String buyerId,
  }) async {
    final result = await apiManger.postRequestForHme(
      token: token,
      endPoints: EndPoints.addToComparisonEndPoint,
      queryParameters: {"ItemId": itemId, "BuyerId": buyerId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.data["message"]),
    );
  }
}
