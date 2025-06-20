import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/view_model/orders_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/view_model/orders_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/widgtes/no_orders_widget.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/widgtes/order_card.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final token = arguments[0] as String;
    final userId = arguments[1] as String;
    return BlocProvider(
      create: (context) => getIt<OrdersViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(size: 33),
          title: Text('My Orders', style: theme.textTheme.titleMedium),
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<OrdersViewModel, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrdersError) {
              return Center(
                child: Text(
                  state.message,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              );
            } else if (state is OrdersLoaded) {
              if (state.orderModel.isEmpty) {
                return NoOrdersWidget(theme: theme);
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<OrdersViewModel>().getOrders(
                    userId: userId,
                    token: token,
                  );
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 10,
                  ),
                  itemCount: state.orderModel.length,
                  itemBuilder: (context, index) {
                    final order = state.orderModel[index];
                    return OrderCard(order: order);
                  },
                ),
              );
            } else {
              context.read<OrdersViewModel>().getOrders(
                userId: userId,
                token: token,
              );
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
