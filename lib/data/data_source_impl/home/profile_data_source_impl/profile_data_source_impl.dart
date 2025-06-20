import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/account_tab_data_source/profile_data_source/profile_data_source.dart';
import 'package:smart_ecommerce/data/models/profile_model/ProfileModel.dart';
@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl extends ProfileDataSource {
  ApiManger apiManger;
  @factoryMethod
  ProfileDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, ProfileModel>> getProfile({required String token, required String userId}) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getProfileDetailsEndPoint,
      token: token,
      queryParameters: {"id": userId},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ProfileModel.fromJson(response.data)),
    );
  }
  
}