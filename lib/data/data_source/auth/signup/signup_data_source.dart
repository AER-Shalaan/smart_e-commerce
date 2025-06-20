import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/auth_model/signup_model/sign_up_model.dart';

abstract class SignUpDataSource {
  Future<Either<Failure, SignUpModel>> signUp({
    required String buyerName,
    required String email,
    required String phone,
    required String password,
  });
}
