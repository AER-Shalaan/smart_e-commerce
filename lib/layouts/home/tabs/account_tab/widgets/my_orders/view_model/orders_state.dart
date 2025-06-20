
import 'package:smart_ecommerce/data/models/order_model/order_model.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderModel> orderModel;
  OrdersLoaded(this.orderModel);
}

class OrdersError extends OrdersState {
  final String message;
  OrdersError(this.message);
}
