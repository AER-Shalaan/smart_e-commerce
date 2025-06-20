import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/add_item_view_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/add_item_view_model.dart';

@Injectable(as: AddItemViewDataSource)
class AddItemViewDataSourceImpl extends AddItemViewDataSource {
  final ApiManger apiManger;

  @factoryMethod
  AddItemViewDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, AddItemViewModel>> addItemView({
    required String token,
    required int userId,
    required String itemId,
  }) async {
    final result = await apiManger.postRequestForHme(
      endPoints: EndPoints.addItemViewEndPoint,
      token: token,
      queryParameters: {"Buyer_ID": userId, "Item_ID": itemId},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AddItemViewModel.fromJson(response.data)),
    );
  }
}
