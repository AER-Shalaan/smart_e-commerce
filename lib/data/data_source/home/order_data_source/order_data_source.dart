import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/order_model/orders_response_model.dart';

abstract class OrderDataSource {
  Future<Either<Failure, OrdersResponseModel>> getOrders({
    required String userId,
    required String token,
  });
}
