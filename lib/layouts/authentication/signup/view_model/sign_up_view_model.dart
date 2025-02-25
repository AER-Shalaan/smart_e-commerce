import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/view_model/sign_up_view_model_state.dart';

import '../../../../data/data_source/signup/signup_data_source.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  @factoryMethod
  SignUpViewModel(this.signUpDataSource) : super(SignUpInitState());

  final SignUpDataSource signUpDataSource;

  static SignUpViewModel get(BuildContext context) => BlocProvider.of(context);

  Future<void> signUp(
    String buyerName,
    String email,
    String phone,
    String password,
    String location,
    BuildContext context,
  ) async {
    emit(SignUpLoadingState());

    final response = await signUpDataSource.signUp(
      buyerName: buyerName,
      email: email,
      phone: phone,
      password: password,
      location: location,
    );

    response.fold(
      (error) {
        emit(SignUpErrorState(error));
      },
      (signUp) {
        if (signUp.message == "success") {
          emit(SignUpSuccessState(signUp));
        } else {
          emit(SignUpErrorState(signUp.message ?? "Unknown error occurred"));
        }
      },
    );
  }
}
