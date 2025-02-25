import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/body_titles.dart';
import 'package:smart_ecommerce/data/models/category.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/category_widget.dart';

class CategoryWidgetBuilder extends StatelessWidget {
  const CategoryWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyTitles(
            title: "Category",
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CategoryWidget(
                categorys: Categorys.categoryList[index],
              ),
              itemCount: Categorys.categoryList.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 50,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
