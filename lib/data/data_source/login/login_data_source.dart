import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/data/models/login_model/LoginModel.dart';

abstract class LoginDataSource {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  });
}
