import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/comparison_data_source.dart';

@Injectable(as: ComparisonDataSource)
class ComparisonDataSourceImpl implements ComparisonDataSource {
  final ApiManger apiManger;
  @factoryMethod
  ComparisonDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, Map<String, List<Map<String, dynamic>>>>>
  getComparisonLists({required String buyerId, required String token}) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getComparisonEndPoint,
      queryParameters: {"BuyerId": buyerId},
      token: token,
    );

    return result.fold((failure) => Left(failure), (response) {
      final data = response.data as Map<String, dynamic>;
      final mapped = data.map((key, value) {
        final products = value['Data'] ?? [];
        return MapEntry(key, List<Map<String, dynamic>>.from(products));
      });
      return Right(mapped);
    });
  }

  @override
  Future<Either<Failure, String>> removeItemFromComparison({
    required String itemId,
    required String buyerId,
    required String token,
  }) async {
    final result = await apiManger.deleteRequest(
      endPoints: EndPoints.removeFromComparisonEndPoint,
      token: token,
      queryParameters: {'ItemId': itemId, 'BuyerId': buyerId},
    );
    return result.fold((failure) => Left(failure), (response) {
      final msg = response.data['message'] ?? 'Deleted';
      return Right(msg);
    });
  }
}
