import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/config/auth_session.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/provider/category_provider.dart';
import 'package:smart_ecommerce/layouts/home/views/home_view_mobile_layout.dart';
import 'package:smart_ecommerce/layouts/home/widgets/tablet_drawer.dart';

class UiLayoutBuilder extends StatefulWidget {
  const UiLayoutBuilder({super.key});

  @override
  State<UiLayoutBuilder> createState() => _UiLayoutBuilderState();
}

class _UiLayoutBuilderState extends State<UiLayoutBuilder> {
  String? token;
  String? userId;
  Timer? _tokenCheckTimer;
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    _loadSession();
    _startTokenMonitor();
  }

  @override
  void dispose() {
    _tokenCheckTimer?.cancel();
    _dialogShown = false;
    super.dispose();
  }

  Future<void> _loadSession() async {
    final session = await AuthSession.getSession();
    if (session != null) {
      setState(() {
        token = session.token;
        userId = session.userId;
      });
    }
  }

  void _startTokenMonitor() {
    _tokenCheckTimer = Timer.periodic(const Duration(minutes: 1), (
      timer,
    ) async {
      final session = await AuthSession.getSession();
      if (session == null && !_dialogShown && mounted) {
        _dialogShown = true;
        _tokenCheckTimer?.cancel();

        if (!context.mounted) return;

        await showDialog(
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
                    onPressed: () async {
                      await AuthSession.clear();
                      if (mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginViewRouteName,
                          (route) => false,
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

    if (token == null || userId == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return Row(
            children: [
              Expanded(child: TabletDrawer(token: token!, userId: userId!)),
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
