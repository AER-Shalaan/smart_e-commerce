import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/widgets/tablet_drawer.dart';

import '../views/home_view_mobile_layout.dart';

class UiLayoutBuilder extends StatelessWidget {
  const UiLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return const Row(
            children: [
              Expanded(child: TabletDrawer()),
              Expanded(flex: 3, child: HomeViewMobileLayout()),
            ],
          );
        } else {
          return const HomeViewMobileLayout();
        }
      },
    );
  }
}
