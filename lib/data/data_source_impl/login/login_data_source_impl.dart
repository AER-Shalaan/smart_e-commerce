import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_manger.dart';
import '../../../core/api/end_points.dart';
import '../../data_source/login/login_data_source.dart';
import '../../models/login_model/LoginModel.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  ApiManger apiManger;
  @factoryMethod
  LoginDataSourceImpl(this.apiManger);
  @override
  Future<Either<String, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await apiManger.postRequest(
        endPoints: EndPoints.loginEndPoint,
        body: {"UserEmail": email, "Password": password},
      );
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
