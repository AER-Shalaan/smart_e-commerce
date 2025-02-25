import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/resuebale_componants/carousel_image.dart';
import '../../../../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/assets.dart';
import '../../../cubits/my_orders_cubit/orders_cubit.dart';
import '../../../cubits/my_orders_cubit/orders_state.dart';
import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 400;

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
            if (order.images.isNotEmpty)
              SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth * 0.23,
                child: CarouselImage(imageUrls: order.images),
              )
            else
              const Center(child: Text("No images available")),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.items.join(", "),
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    "Total: \$${order.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.013),
                  decoration: BoxDecoration(
                      color: order.currentStatus.status != 'Delivered'
                          ? Colors.orange.withOpacity(0.3)
                          : Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    order.currentStatus.status,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      fontWeight: FontWeight.bold,
                      color: order.currentStatus.status != 'Delivered'
                          ? Colors.orange
                          : Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                order.currentStatus.status != 'Delivered'
                    ? CustomMainButton(
                        height: screenHeight * 0.045,
                        width: screenWidth * 0.32,
                        label: "Track Order",
                        fontSize: MediaQuery.of(context).size.width * 0.028,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            enableDrag: false,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) => Container(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              decoration: const BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Order Status",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(Icons.close, size: 24),
                                      ),
                                    ],
                                  ),
                                  const Divider(thickness: 1),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text("data"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : order.rating == 0
                        ? CustomMainButton(
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.32,
                            label: "Leave Review",
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  enableDrag: false,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (context) => Container(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.04),
                                      height: screenHeight * 0.5,
                                      decoration: const BoxDecoration(
                                        color: AppColors.backGroundColor,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Leave a Review",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  icon: const Icon(Icons.close,
                                                      size: 24),
                                                ),
                                              ],
                                            ),
                                            const Divider(thickness: 1),
                                            SizedBox(
                                                height: screenHeight * 0.01),
                                            const Text(
                                              "How was your order?",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                                height: screenHeight * 0.005),
                                            const Text(
                                              "Please give your rating and also your review.",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                            ),
                                            BlocBuilder<OrdersCubit,
                                                OrdersState>(
                                              builder: (context, state) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidth * 0.1),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(5,
                                                        (index) {
                                                      return IconButton(
                                                        icon: Icon(
                                                          index <
                                                                  state
                                                                      .selectedRating
                                                              ? Icons
                                                                  .star_rounded
                                                              : Icons
                                                                  .star_border_rounded,
                                                          size: 30,
                                                          color: Colors.amber,
                                                        ),
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  OrdersCubit>()
                                                              .setRating(
                                                                  index + 1);
                                                          context
                                                                  .read<
                                                                      OrdersCubit>()
                                                                  .currntrating =
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
                                                hintText:
                                                    "Write your review...",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              maxLines: 4,
                                            ),
                                            const Spacer(),
                                            const CustomMainButton(
                                              label: "Submit",
                                              width: double.infinity,
                                            )
                                          ])));
                            },
                          )
                        : Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(Assets.assetsImagesActaivStar),
                                Text(
                                  " ${order.rating}/5",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// child: FixedTimeline.tileBuilder(
//   builder: TimelineTileBuilder.connected(
//     itemCount: order.tracking.length,
//     contentsAlign:
//         ContentsAlign.alternating,
//     contentsBuilder: (context, index) {
//       final status =
//           order.tracking[index];
//       return Padding(
//         padding:
//             const EdgeInsets.symmetric(
//                 vertical: 12,
//                 horizontal: 12),
//         child: Column(
//           crossAxisAlignment:
//               CrossAxisAlignment.start,
//           children: [
//             Text(
//               status.status,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight:
//                     FontWeight.bold,
//               ),
//             ),
//             Text(
//               status.location,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//             Text(
//               DateFormat(
//                       'yyyy-MM-dd HH:mm')
//                   .format(
//                       status.timestamp),
//               style: TextStyle(
//                   fontSize: 12,
//                   color: Colors
//                       .grey.shade600),
//             ),
//           ],
//         ),
//       );
//     },
//     indicatorBuilder: (context, index) {
//       final isCurrent = index ==
//           order.currentStatusIndex;
//       final isCompleted = index <
//           order.currentStatusIndex;
//       return DotIndicator(
//         size: 16,
//         color: isCurrent
//             ? Colors.blue
//             : (isCompleted
//                 ? Colors.green
//                 : Colors.grey),
//       );
//     },
//     connectorBuilder:
//         (context, index, type) {
//       return SolidLineConnector(
//         thickness: 2,
//         color: index <
//                 order.currentStatusIndex
//             ? Colors.green
//             : Colors.grey,
//       );
//     },
//   ),
// ),