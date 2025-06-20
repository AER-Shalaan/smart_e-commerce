import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/auth/reset_password/reset_password_data_source.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/view_model/reset_passord_view_model_state.dart';

@injectable
class ResetPassordViewModel extends Cubit<ResetPassordViewModelState> {
  final ResetPasswordDataSource resetPasswordDataSource;

  @factoryMethod
  ResetPassordViewModel(this.resetPasswordDataSource)
      : super(ResetPassordViewModelInitial());

  static ResetPassordViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> sendOtp({required String email}) async {
    emit(ResetPassordSendOtpLoading());
    final result = await resetPasswordDataSource.sendOtp(email: email);
    result.fold(
      (failure) => emit(ResetPassordSendOtpError(failure)),
      (resetPasswordModel) => emit(ResetPassordSendOtpSuccess(resetPasswordModel)),
    );
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(ResetPassordVerifyLoading());
    final result = await resetPasswordDataSource.verifyOtp(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ResetPassordVerifyError(failure)),
      (resetPasswordModel) => emit(ResetPassordVerifySuccess(resetPasswordModel)),
    );
  }
}
