import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/data_source/auth/login/login_data_source.dart';
import 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  @factoryMethod
  LoginViewModel(this.loginDataSource) : super(LoginInitState());

  final LoginDataSource loginDataSource;

  static LoginViewModel get(BuildContext context) => BlocProvider.of(context);

  Future<void> login(
  String email,
  String password,
  BuildContext context,
) async {
  emit(LoginLoadingState());

  final response = await loginDataSource.login(
    email: email,
    password: password,
  );

  response.fold(
    (error) {
      emit(LoginErrorState(error.message));
    },
    (login) {
      if (login.message == "success") {
        emit(LoginSuccessState(login));
      } else {
        emit(LoginErrorState(login.message ?? "Unknown error occurred"));
      }
    },
  );
}
}
