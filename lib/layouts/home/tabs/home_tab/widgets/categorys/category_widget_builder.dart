import 'package:flutter/material.dart';

class CategoryWidgetBuilder extends StatelessWidget {
  const CategoryWidgetBuilder({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
    );
  }
}

//  final bool isTablet = MediaQuery.of(context).size.width >= 600;
//     final List<Color> softColors = [
//       Colors.blue.withAlpha(30),
//       Colors.green.withAlpha(30),
//       Colors.orange.withAlpha(30),
//       Colors.purple.withAlpha(30),
//       Colors.pink.withAlpha(30),
//       Colors.teal.withAlpha(30),
//     ];

//     return BlocProvider(
//       create: (_) => getIt<CategoriesViewModel>()..getCategories(token),
//       child: BlocBuilder<CategoriesViewModel, CategoriesState>(
//         builder: (context, state) {
//           if (state is CategoriesLoadingState) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child:
//                   isTablet
//                       ? GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: 6,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.2,
//                               mainAxisSpacing: 12,
//                               crossAxisSpacing: 12,
//                             ),
//                         itemBuilder: (_, __) => shimmerCategoryItem(isTablet),
//                       )
//                       : SizedBox(
//                         height: 120,
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 6,
//                           separatorBuilder:
//                               (_, __) => const SizedBox(width: 16),
//                           itemBuilder: (_, __) => shimmerCategoryItem(isTablet),
//                         ),
//                       ),
//             );
//           } else if (state is CategoriesErrorState) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               AppSnackBar.show(
//                 context: context,
//                 message: state.message,
//                 icon: Icons.error,
//                 backgroundColor: Colors.red,
//                 fromTop: true,
//               );
//             });
//             return const SizedBox();
//           } else if (state is CategoriesSuccessState) {
//             final categories = state.categories;

//             if (categories.isEmpty) {
//               return const Center(child: Text("No categories found"));
//             }

//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child:
//                   isTablet
//                       ? SizedBox(
//                         height: 260,
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           itemCount: (categories.length / 2).ceil(),
//                           separatorBuilder:
//                               (_, __) => const SizedBox(width: 16),
//                           itemBuilder: (context, i) {
//                             final int topIndex = i * 2;
//                             final int bottomIndex = topIndex + 1;
//                             return Column(
//                               children: [
//                                 if (topIndex < categories.length)
//                                   AnimatedCategoryItem(
//                                     index: topIndex,
//                                     child: CategoryWidget(
//                                       categories: categories[topIndex],
//                                       color:
//                                           softColors[topIndex %
//                                               softColors.length],
//                                     ),
//                                   ),
//                                 const SizedBox(height: 12),
//                                 if (bottomIndex < categories.length)
//                                   AnimatedCategoryItem(
//                                     index: bottomIndex,
//                                     child: CategoryWidget(
//                                       categories: categories[bottomIndex],
//                                       color:
//                                           softColors[bottomIndex %
//                                               softColors.length],
//                                     ),
//                                   ),
//                               ],
//                             );
//                           },
//                         ),
//                       )
//                       : SizedBox(
//                         height: 120,
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: categories.length,
//                           separatorBuilder:
//                               (_, __) => const SizedBox(width: 16),
//                           itemBuilder:
//                               (context, index) => AnimatedCategoryItem(
//                                 index: index,
//                                 child: CategoryWidget(
//                                   categories: categories[index],
//                                   color: softColors[index % softColors.length],
//                                 ),
//                               ),
//                         ),
//                       ),
//             );
//           }

//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }

//   Widget shimmerCategoryItem(bool isTablet) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Container(
//         width: isTablet ? 120 : 90,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: isTablet ? 30 : 24,
//               backgroundColor: Colors.white,
//             ),
//             const SizedBox(height: 8),
//             Container(
//               height: 12,
//               width: isTablet ? 60 : 40,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnimatedCategoryItem extends StatefulWidget {
//   const AnimatedCategoryItem({
//     super.key,
//     required this.child,
//     required this.index,
//   });

//   final Widget child;
//   final int index;

//   @override
//   State<AnimatedCategoryItem> createState() => _AnimatedCategoryItemState();
// }

// class _AnimatedCategoryItemState extends State<AnimatedCategoryItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnim;
//   late Animation<Offset> _offsetAnim;

//   bool _hovering = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 250),
//       vsync: this,
//     );

//     _opacityAnim = Tween<double>(begin: 0, end: 1).animate(_controller);
//     _offsetAnim = Tween<Offset>(
//       begin: const Offset(0, 0.03),
//       end: Offset.zero,
//     ).animate(_controller);

//     Future.delayed(Duration(milliseconds: widget.index * 30), () {
//       if (mounted) _controller.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovering = true),
//       onExit: (_) => setState(() => _hovering = false),
//       child: AnimatedScale(
//         scale: _hovering ? 1.03 : 1.0,
//         duration: const Duration(milliseconds: 200),
//         child: SlideTransition(
//           position: _offsetAnim,
//           child: FadeTransition(opacity: _opacityAnim, child: widget.child),
//         ),
//       ),
//     );
//   }
// }
