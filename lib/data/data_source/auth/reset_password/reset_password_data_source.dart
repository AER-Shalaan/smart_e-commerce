import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/auth_model/reset_password_model/ResetPasswordModel.dart';

abstract class ResetPasswordDataSource {
  Future<Either<Failure, ResetPasswordModel>> sendOtp({required String email});

  Future<Either<Failure, ResetPasswordModel>> verifyOtp({
    required String email,
    required String otp,
    required String newPassword,
  });
}
