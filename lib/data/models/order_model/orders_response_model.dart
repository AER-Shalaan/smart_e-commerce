
import 'package:smart_ecommerce/data/models/order_model/order_model.dart';

class OrdersResponseModel {
  final String message;
  final List<OrderModel> data;

  OrdersResponseModel({
    required this.message,
    required this.data,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return OrdersResponseModel(
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
    );
  }
}
