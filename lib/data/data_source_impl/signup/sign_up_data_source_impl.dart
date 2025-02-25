import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_manger.dart';
import '../../../core/api/end_points.dart';
import '../../data_source/signup/signup_data_source.dart';
import '../../models/signup_model/sign_up_model.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource {
  ApiManger apiManger;
  @factoryMethod
  SignUpDataSourceImpl(this.apiManger);
  @override
  Future<Either<String, SignUpModel>> signUp({
    required String buyerName,
    required String email,
    required String phone,
    required String password,
    required String location,
  }) async {
    try {
      var response = await apiManger.postRequest(
        endPoints: EndPoints.signupEndPoint,
        body: {
          "buyer_Name": buyerName,
          "email": email,
          "phone": phone,
          "password": password,
          "location": location,
        },
      );
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      throw Left(e.toString());
    }
  }
}
