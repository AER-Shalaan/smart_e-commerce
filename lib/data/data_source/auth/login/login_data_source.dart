import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/auth_model/login_model/login_model.dart';

abstract class LoginDataSource {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });
}
