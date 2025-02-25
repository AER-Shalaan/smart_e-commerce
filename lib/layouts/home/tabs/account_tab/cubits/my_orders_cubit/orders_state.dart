import 'package:equatable/equatable.dart';

import '../../widgets/my_orders/models/order.dart';

class OrdersState extends Equatable {
  final int selectedIndex;
  final int selectedRating;

  final List<OrderModel> orders;

  const OrdersState(
      {this.selectedIndex = 0,
      this.orders = const [],
      this.selectedRating = 0});

  OrdersState copyWith({
    int? selectedIndex,
    List<OrderModel>? orders,
    int? selectedRating,
  }) {
    return OrdersState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      orders: orders ?? this.orders,
      selectedRating: selectedRating ?? this.selectedRating,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, orders, selectedRating];
}

final class OrdersInitial extends OrdersState {}
