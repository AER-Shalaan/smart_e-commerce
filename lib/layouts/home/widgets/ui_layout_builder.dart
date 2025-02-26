import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/views/home_view_mobile_layout.dart';
import 'package:smart_ecommerce/layouts/home/widgets/tablet_drawer.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UiLayoutBuilder extends StatefulWidget {
  const UiLayoutBuilder({super.key});

  @override
  State<UiLayoutBuilder> createState() => _UiLayoutBuilderState();
}

class _UiLayoutBuilderState extends State<UiLayoutBuilder> {
  String? token;
  String? userId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _extractUserId();
  }
  
  void _extractUserId() {
    final String? receivedToken =
        ModalRoute.of(context)!.settings.arguments as String?;

    if (receivedToken != null && receivedToken.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(receivedToken);
      setState(() {
        token = receivedToken;
        userId = decodedToken['nameid']; // Extract userId from token
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return Row(
            children: [
              const Expanded(child: TabletDrawer()),
              Expanded(
                flex: 3,
                child: HomeViewMobileLayout(
                  token: token ?? '',
                  userId: userId ?? '',
                ),
              ),
            ],
          );
        } else {
          return HomeViewMobileLayout(
            token: token ?? "",
            userId: userId ?? '',
          );
        }
      },
    );
  }
}
