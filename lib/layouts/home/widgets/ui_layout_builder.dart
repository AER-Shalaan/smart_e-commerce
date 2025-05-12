import 'package:flutter/material.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/layouts/home/views/home_view_mobile_layout.dart';
import 'package:smart_ecommerce/layouts/home/widgets/tablet_drawer.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:async';

class UiLayoutBuilder extends StatefulWidget {
  const UiLayoutBuilder({super.key});

  @override
  State<UiLayoutBuilder> createState() => _UiLayoutBuilderState();
}

class _UiLayoutBuilderState extends State<UiLayoutBuilder> {
  String? token;
  String? userId;
  Timer? _tokenCheckTimer;

  @override
  void initState() {
    super.initState();
    _extractUserId();
    _startTokenMonitor();
  }

  @override
  void dispose() {
    _tokenCheckTimer?.cancel();
    super.dispose();
  }

  void _extractUserId() async {
    final String? receivedToken = await SharedPreferencesFunctions.getToken();
    if (receivedToken != null && receivedToken.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(receivedToken);
      setState(() {
        token = receivedToken;
        userId = decodedToken['nameid'];
      });
    }
  }

  void _startTokenMonitor() {
    _tokenCheckTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
      final currentToken = await SharedPreferencesFunctions.getToken();
      if (currentToken == null || JwtDecoder.isExpired(currentToken)) {
        _tokenCheckTimer?.cancel();
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) => AlertDialog(
                  title: const Text("Session Expired"),
                  content: const Text(
                    "Your session has expired. Please log in again.",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        SharedPreferencesFunctions.clearToken();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginViewRouteName,
                          (route) => false,
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token == null || userId == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return Row(
            children: [
              const Expanded(child: TabletDrawer()),
              Expanded(
                flex: 3,
                child: HomeViewMobileLayout(token: token!, userId: userId!),
              ),
            ],
          );
        } else {
          return HomeViewMobileLayout(token: token!, userId: userId!);
        }
      },
    );
  }
}
