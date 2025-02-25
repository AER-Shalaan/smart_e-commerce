import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manger.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/data/data_source/login/login_data_source.dart';
import 'package:smart_ecommerce/data/models/login_model/LoginModel.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  ApiManger apiManger;
  @factoryMethod
  LoginDataSourceImpl(this.apiManger);
  @override
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiManger.postRequest(
        endPoints: EndPoints.loginEndPoint,
        body: {"UserEmail": email, "Password": password},
      );
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}
