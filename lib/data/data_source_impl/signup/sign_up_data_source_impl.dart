import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/signup/signup_data_source.dart';
import 'package:smart_ecommerce/data/models/signup_model/sign_up_model.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource {
  final ApiManger apiManger;

  @factoryMethod
  SignUpDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, SignUpModel>> signUp({
    required String buyerName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final result = await apiManger.postRequest(
      endPoints: EndPoints.signupEndPoint,
      body: {
        "buyer_Name": buyerName,
        "email": email,
        "phone": phone,
        "password": password,
      },
    );

    return result.map((response) => SignUpModel.fromJson(response.data));
  }
}
