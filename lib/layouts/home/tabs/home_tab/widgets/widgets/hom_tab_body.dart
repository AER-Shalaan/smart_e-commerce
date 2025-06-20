import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisements/adv_widget_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisements/provider/adv_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/advertisments2/adv_widget_builder2.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/best_seller/best_seller_widget_buider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/category_widget_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/featured_product/featured_product_widget_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/new_arrivals/new_arrivals_widget_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/recommended/recommended_widget_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/recommended/view_model/recommended_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/top_rated_product/top_rated_product_widget_builder.dart';

class HomeTabBody extends StatefulWidget {
  const HomeTabBody({super.key, required this.token, required this.userId});
  final String token;
  final String userId;
  @override
  State<HomeTabBody> createState() => _HomeTabBodyState();
}

class _HomeTabBodyState extends State<HomeTabBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userId = widget.userId;
    var width = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverSizedBoxSpace(height: 20),
        SliverToBoxAdapter(
          child: ChangeNotifierProvider(
            create: (context) => AdvProvider(),
            child: const AdvWidgetBuilder(),
          ),
        ),
        const SliverSizedBoxSpace(height: 30),
        SliverToBoxAdapter(
          child: Visibility(
            visible: width <= 500,
            child: CategoryWidgetBuilder(token: widget.token, userId: userId),
          ),
        ),
        const SliverSizedBoxSpace(height: 20),
        SliverToBoxAdapter(
          child: BlocProvider(
            create:
                (context) =>
                    getIt<RecommendedProductsCubit>()
                      ..getRecommendedList(userId: userId),
            child: RecommendedWidgetBuilder(
              token: widget.token,
              userId: widget.userId,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerWidgetBuider(
            token: widget.token,
            userId: widget.userId,
          ),
        ),
        const SliverSizedBoxSpace(height: 20),
        SliverToBoxAdapter(
          child: NewArrivalsWidgetBuilder(
            token: widget.token,
            userId: widget.userId,
          ),
        ),
        const SliverSizedBoxSpace(height: 20),
        SliverToBoxAdapter(
          child: TopRatedProductWidgetBuilder(
            token: widget.token,
            userId: widget.userId,
          ),
        ),
        const SliverSizedBoxSpace(height: 30),
        const AdvWidgetBuilder2(),
        const SliverSizedBoxSpace(height: 30),
        SliverToBoxAdapter(
          child: FeaturedProductWidgetBuilder(
            token: widget.token,
            userId: widget.userId,
          ),
        ),
        const SliverSizedBoxSpace(height: 10),
      ],
    );
  }
}

class SliverSizedBoxSpace extends StatelessWidget {
  const SliverSizedBoxSpace({super.key, this.height = 0, this.width = 0});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height, width: width));
  }
}
