import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/auth/reset_password/reset_password_data_source.dart';
import 'package:smart_ecommerce/data/models/auth_model/reset_password_model/reset_password_model.dart';

@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl extends ResetPasswordDataSource {
  ApiManger apiManger;
  @factoryMethod
  ResetPasswordDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, ResetPasswordModel>> sendOtp({
    required String email,
  }) async {
    var result = await apiManger.postRequest(
      endPoints: EndPoints.sendOtpEndPoint,
      body: {"email": email},
    );
    return result.fold((failure) => Left(failure), (response) {
      return Right(ResetPasswordModel.fromJson(response.data));
    });
  }

  @override
  Future<Either<Failure, ResetPasswordModel>> verifyOtp({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    var result = await apiManger.postRequest(
      endPoints: EndPoints.verifyOtpEndPoint,
      body: {"email": email, "otp": otp, "newPassword": newPassword},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ResetPasswordModel.fromJson(response.data)),
    );
  }
}
