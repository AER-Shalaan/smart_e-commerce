import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/widgets/hom_tab_body.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/widgets/home_tab_app_bar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const HomeTabAppBar(),
          ];
        },
        body: const HomeTabBody());
  }
}
