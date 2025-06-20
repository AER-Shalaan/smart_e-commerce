import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/order_data_source/order_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/view_model/orders_state.dart';
@injectable
class OrdersViewModel extends Cubit<OrdersState> {
  final OrderDataSource dataSource;
  @factoryMethod
  OrdersViewModel(this.dataSource) : super(OrdersInitial());

  Future<void> getOrders({required String userId, required String token}) async {
    emit(OrdersLoading());
    final result = await dataSource.getOrders(userId: userId, token: token);
    result.fold(
      (failure) => emit(OrdersError(failure.message)),
      (ordersResponse) => emit(OrdersLoaded(ordersResponse.data)),
    );
  }
}