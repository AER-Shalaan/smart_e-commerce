import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/my_orders/data/dummy_data.dart';
import '../../widgets/my_orders/models/order.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  int selectedIndex = 0;
  int currntrating = 0;

  void changeStatus(int index) {
    emit(state.copyWith(selectedIndex: index));
    selectedIndex = index;

    final List<OrderModel> filteredOrders =
        allOrders.where((order) {
          String? currentStatus = order.currentStatus.status;
          return (index == 1 && currentStatus == "Delivered") ||
              (index == 0 && currentStatus != "Delivered");
        }).toList();

    emit(state.copyWith(orders: filteredOrders));
  }

  void setRating(int rating) {
    emit(state.copyWith(selectedRating: rating));
  }
}
