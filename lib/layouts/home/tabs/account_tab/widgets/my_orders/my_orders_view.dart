import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/widgtes/order_card.dart';

import '../../../../../../core/utils/assets.dart';
import '../../cubits/my_orders_cubit/orders_cubit.dart';
import '../../cubits/my_orders_cubit/orders_state.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 400;

    context.read<OrdersCubit>().changeStatus(
      context.read<OrdersCubit>().selectedIndex,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          size: screenWidth * 0.08,
          color: theme.iconTheme.color,
        ),
        centerTitle: true,
        title: Text(
          "My Orders",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: isSmallScreen ? 18 : 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                color: theme.dividerColor.withAlpha(90),
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
              ),
              child: BlocSelector<OrdersCubit, OrdersState, int>(
                selector: (state) => state.selectedIndex,
                builder: (context, selectedIndex) {
                  return ToggleButtons(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth * 0.03),
                    ),
                    selectedBorderColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    fillColor: theme.colorScheme.surface,
                    color: theme.disabledColor,
                    selectedColor: theme.colorScheme.primary,
                    splashColor: theme.colorScheme.primary.withAlpha(25),
                    constraints: BoxConstraints(
                      minWidth: screenWidth * 0.4,
                      minHeight: screenHeight * 0.04,
                    ),
                    isSelected: [selectedIndex == 0, selectedIndex == 1],
                    onPressed: (index) {
                      context.read<OrdersCubit>().changeStatus(index);
                    },
                    children: [
                      Text(
                        "Ongoing",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: isSmallScreen ? 12 : 14,
                          fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                          color: selectedIndex == 0 ? theme.colorScheme.primary : theme.disabledColor,
                        ),
                      ),
                      Text(
                        "Completed",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: isSmallScreen ? 12 : 14,
                          fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                          color: selectedIndex == 1 ? theme.colorScheme.primary : theme.disabledColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                final emptyOngoing = state.selectedIndex == 0 && state.orders.isEmpty;
                final emptyCompleted = state.selectedIndex == 1 && state.orders.isEmpty;

                if (emptyOngoing || emptyCompleted) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsIconsBox,
                        height: screenHeight * 0.1,
                        colorFilter: ColorFilter.mode(
                          theme.disabledColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        emptyOngoing ? "No Ongoing Orders!" : "No Completed Orders!",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: isSmallScreen ? 18 : 20,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        emptyOngoing
                            ? "You don’t have any ongoing orders\nat this time."
                            : "You don’t have any Completed orders\nfor now.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.disabledColor,
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    final order = state.orders[index];
                    return OrderCard(order: order);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
