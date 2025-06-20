import 'package:equatable/equatable.dart';
import '../../../../data/models/auth_model/login_model/login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  const LoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  const LoginSuccessState(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}
