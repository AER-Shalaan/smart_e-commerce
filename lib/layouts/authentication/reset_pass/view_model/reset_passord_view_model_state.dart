import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/auth_model/reset_password_model/reset_password_model.dart';


abstract class ResetPassordViewModelState {}

class ResetPassordViewModelInitial extends ResetPassordViewModelState {}

class ResetPassordSendOtpLoading extends ResetPassordViewModelState {}

class ResetPassordSendOtpSuccess extends ResetPassordViewModelState {
  final ResetPasswordModel resetPasswordModel;

  ResetPassordSendOtpSuccess(this.resetPasswordModel);
}

class ResetPassordSendOtpError extends ResetPassordViewModelState {
  final Failure error;

  ResetPassordSendOtpError(this.error);
}

class ResetPassordVerifyLoading extends ResetPassordViewModelState {}

class ResetPassordVerifySuccess extends ResetPassordViewModelState {
  final ResetPasswordModel resetPasswordModel;

  ResetPassordVerifySuccess(this.resetPasswordModel);
}

class ResetPassordVerifyError extends ResetPassordViewModelState {
  final Failure error;

  ResetPassordVerifyError(this.error);
}
