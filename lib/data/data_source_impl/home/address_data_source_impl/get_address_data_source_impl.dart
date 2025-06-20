import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/address_data_source/get_address_data_source.dart';
import 'package:smart_ecommerce/data/models/address_model/address_response.dart';

@Injectable(as: GetAddressDataSource)
class GetAddressDataSourceImpl extends GetAddressDataSource {
  ApiManger apiManger;
  @factoryMethod
  GetAddressDataSourceImpl(this.apiManger);
  @override
  Future<Either<Failure, AddressResponse>> getAddress({
    required String token,
    required String userId,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getAddressEndPoint,
      token: token,
      queryParameters: {"UserId": userId},
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AddressResponse.fromJson(response.data)),
    );
  }
}
