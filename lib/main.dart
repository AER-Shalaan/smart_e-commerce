import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/api/api_manger.dart';
import 'di/di.dart';
import 'layouts/cubit/bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiManger.init();
  configureDependencies();
  return runApp(const MyApp());
}
//DevicePreview(enabled: true, builder: (context) => 