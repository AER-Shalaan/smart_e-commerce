import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/order_data_source/order_data_source.dart';
import 'package:smart_ecommerce/data/models/order_model/orders_response_model.dart';

@Injectable(as: OrderDataSource)
class OrderDataSourceImpl extends OrderDataSource {
  final ApiManger apiManager;

  @factoryMethod
  OrderDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failure, OrdersResponseModel>> getOrders(
    {required String userId, required String token}) async{
    final result = await apiManager.getRequest(
      endPoints: EndPoints.getOrdersEndPoint,
      token: token,
      queryParameters: {"UserId": userId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(OrdersResponseModel.fromJson(response.data)),
    );
  }

}
