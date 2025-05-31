import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'config/app_theme.dart';
import 'core/utils/routes.dart';
import 'layouts/home/tabs/account_tab/cubits/my_orders_cubit/orders_cubit.dart';
import 'layouts/home/tabs/account_tab/cubits/notification_settings_cubit/notification_settings_cubit.dart';
import 'layouts/home/tabs/comparison_tab/cubit/comparison_cubit.dart';
import 'layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => NotificationSettingsCubit()),
        BlocProvider(create: (context) => FilterCubit()),
        BlocProvider(create: (context) => ComparisonCubit()),
        BlocProvider(create: (context) => LoginChecksCubit()),
        BlocProvider(create: (context) => SignUpCheckCubit()),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoutes(),
        initialRoute: Routes.splashRouteName,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
