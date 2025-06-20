import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/view_model/add_item_view_view_model.dart';
import 'package:smart_ecommerce/data/data_source_impl/home/home_tap_data_source_impl/categories_data_source_impl.dart';
import 'package:smart_ecommerce/data/data_source_impl/home/home_tap_data_source_impl/subcategories_from_category_data_source_impl.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/view_model/reset_passord_view_model.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/provider/category_provider.dart';
import 'package:smart_ecommerce/layouts/home/provider/comparison_category_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/view_model/search_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/categories_view_model/categories_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/subcategories_from_category_view_model/subcategories_from_category_view_model.dart';

import 'config/app_theme.dart';
import 'core/utils/routes.dart';
import 'layouts/home/tabs/account_tab/cubits/my_orders_cubit/orders_cubit.dart';
import 'layouts/home/tabs/account_tab/cubits/notification_settings_cubit/notification_settings_cubit.dart';
import 'layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeMode getThemeModeFromString(String themeString) {
    switch (themeString) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
      default:
        return ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => NotificationSettingsCubit()),
        BlocProvider(create: (context) => FilterCubit()),
        ChangeNotifierProvider(create: (_) => ComparisonCategoryProvider()),
        BlocProvider(
          create:
              (_) =>
                  CategoriesViewModel(CategoriesDataSourceImpl((ApiManger()))),
        ),
        BlocProvider(
          create:
              (_) => SubcategoriesFromCategoryViewModel(
                SubcategoriesFromCategoryDataSourceImpl((ApiManger())),
              ),
        ),
        BlocProvider(create: (context) => getIt<AddItemViewViewModel>()),
        BlocProvider(create: (context) => LoginChecksCubit()),
        BlocProvider(create: (context) => SignUpCheckCubit()),
        BlocProvider(create: (context) => getIt<SearchTabViewModel>()),
        BlocProvider(create: (context) => getIt<FilterViewModel>()),
        BlocProvider(create: (context) => getIt<AddressViewModel>()),
        BlocProvider(create: (context) => getIt<ResetPassordViewModel>()),
      ],
      child: FutureBuilder<String>(
        future: SharedPreferencesFunctions.getThemeMode(),
        builder: (context, snapshot) {
          return ChangeNotifierProvider(
            create: (context) => CategoryProvider(),
            child: MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              routes: Routes.getRoutes(),
              initialRoute: Routes.splashRouteName,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
            ),
          );
        },
      ),
    );
  }
}
