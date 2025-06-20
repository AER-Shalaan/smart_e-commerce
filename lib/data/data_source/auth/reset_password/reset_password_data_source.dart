import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/auth_model/reset_password_model/ResetPasswordModel.dart';

abstract class ResetPasswordDataSource {
  Future<Either<Failure, ResetPasswordModel>> resetPassword({
    required String email,
  });
}