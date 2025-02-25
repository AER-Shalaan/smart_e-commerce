import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/views/home_view_mobile_layout.dart';
import 'package:smart_ecommerce/layouts/home/widgets/tablet_drawer.dart';

class UiLayoutBuilder extends StatelessWidget {
  const UiLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final String? token = ModalRoute.of(context)!.settings.arguments as String?;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return Row(
            children: [
              const Expanded(child: TabletDrawer()),
              Expanded(
                flex: 3,
                child: HomeViewMobileLayout(token: token ?? ''),
              ),
            ],
          );
        } else {
          return HomeViewMobileLayout(token: token ?? "");
        }
      },
    );
  }
}
