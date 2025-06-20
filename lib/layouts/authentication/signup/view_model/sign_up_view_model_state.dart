import 'package:equatable/equatable.dart';

import '../../../../data/models/auth_model/signup_model/sign_up_model.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String errorMessage;
  const SignUpErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SignUpSuccessState extends SignUpState {
  final SignUpModel signUpModel;
  const SignUpSuccessState(this.signUpModel);

  @override
  List<Object> get props => [signUpModel];
}
