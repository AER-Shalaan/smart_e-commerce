import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/resuebale_componants/carousel_image.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_main_button.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/cubits/my_orders_cubit/orders_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/cubits/my_orders_cubit/orders_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/widgtes/order_timeline.dart';
import '../models/order.dart';
import '../../../../../../../core/utils/assets.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.all(screenWidth * 0.025),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderImage(
              order: order,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(child: OrderDetails(order: order)),
            OrderActions(
              order: order,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderImage extends StatelessWidget {
  final OrderModel order;
  final double screenWidth;
  final double screenHeight;

  const OrderImage({
    super.key,
    required this.order,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return order.images.isNotEmpty
        ? SizedBox(
          height: screenHeight * 0.1,
          width: screenWidth * 0.23,
          child: CarouselImage(imageUrls: order.images),
        )
        : const Center(child: Text("No images available"));
  }
}

class OrderDetails extends StatelessWidget {
  final OrderModel order;
  const OrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.items.join(", "),
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Total: \$${order.totalPrice.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: isSmallScreen ? 10 : 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class OrderActions extends StatelessWidget {
  final OrderModel order;
  final double screenWidth;
  final double screenHeight;

  const OrderActions({
    super.key,
    required this.order,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        OrderStatusTages(order: order),
        SizedBox(height: screenHeight * 0.03),
        if (order.currentStatus.status != 'Delivered')
          CustomMainButton(
            height: screenHeight * 0.045,
            width: screenWidth * 0.32,
            label: "Track Order",
            fontSize: screenWidth * 0.028,
            onPressed:
                () => _showTrackingModal(
                  context,
                  order,
                  screenWidth,
                  screenHeight,
                ),
          )
        else if (order.rating == 0)
          CustomMainButton(
            height: screenHeight * 0.045,
            width: screenWidth * 0.32,
            label: "Leave Review",
            fontSize: screenWidth * 0.028,
            onPressed:
                () => _showReviewModal(
                  context,
                  order.id,
                  screenWidth,
                  screenHeight,
                  () {
                    // api
                  },
                ),
          )
        else
          _buildRatingDisplay(order, screenWidth, screenHeight),
      ],
    );
  }
}

class OrderStatusTages extends StatelessWidget {
  final OrderModel order;
  const OrderStatusTages({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            order.currentStatus.status != 'Delivered'
                ? Colors.orange.withOpacity(0.3)
                : Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        order.currentStatus.status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color:
              order.currentStatus.status != 'Delivered'
                  ? Colors.orange
                  : Colors.green,
        ),
      ),
    );
  }
}

Widget _buildRatingDisplay(
  OrderModel order,
  double screenWidth,
  double screenHeight,
) {
  return Container(
    height: screenHeight * 0.04,
    width: screenWidth * 0.2,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesActaivStar),
        Text(
          " ${order.rating}/5",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

void _showReviewModal(
  BuildContext context,
  String orderId,
  double screenWidth,
  double screenHeight,
  void Function()? onReviewSubmitted,
) {
  showModalBottomSheet(
    context: context,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder:
        (context) => Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          height: screenHeight * 0.5,
          decoration: const BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Leave a Review",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              const Divider(thickness: 1),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "How was your order?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.005),
              const Text(
                "Please give your Rating",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < state.selectedRating
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: screenWidth * 0.08,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            context.read<OrdersCubit>().setRating(index + 1);
                            context.read<OrdersCubit>().currntrating =
                                index + 1;
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Please give your review.",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                maxLines: 4,
              ),
              const Spacer(),
              CustomMainButton(
                label: "Submit",
                width: double.infinity,
                onPressed: onReviewSubmitted,
              ),
            ],
          ),
        ),
  );
}

void _showTrackingModal(
  BuildContext context,
  OrderModel order,
  double screenWidth,
  double screenHeight,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder:
        (context) => Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Status",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  child: OrderTimeLine(
                    selectedStatusIndex: order.currentStatusIndex,
                    orderStatuses: order.tracking,
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
