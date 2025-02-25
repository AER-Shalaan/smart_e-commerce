import 'package:dartz/dartz.dart';
import '../../models/signup_model/sign_up_model.dart';

abstract class SignUpDataSource {
  Future<Either<String, SignUpModel>> signUp({
    required String buyerName,
    required String email,
    required String phone,
    required String password,
    required String location,
  });
}
