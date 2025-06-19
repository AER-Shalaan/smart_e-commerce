import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/api/api_manager.dart';
import 'di/di.dart';
import 'layouts/cubit/bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiManger.init();
  configureDependencies();
  return runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MyApp(),
    ),
  );
}
