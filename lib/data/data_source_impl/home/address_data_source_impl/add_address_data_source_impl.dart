import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/address_data_source/add_address_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/models/address_model/add_address_model/add_address_request_model.dart';

@LazySingleton(as: AddAddressDataSource)
class AddAddressDataSourceImpl implements AddAddressDataSource {
  final ApiManger apiManger;
  AddAddressDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, String>> addAddress({
    required String token,
    required String userId,
    required AddAddressRequestModel address,
  }) async {
    final response = await apiManger.postRequestForHme(
      endPoints: EndPoints.addAddressEndPoint,
      body: address.toJson(),
      token: token,
      queryParameters: {'UserId': userId},
    );

    return response.fold(
      (failure) => Left(failure),
      (res) {
        final data = res.data;
        if (data is Map && data['message'] == 'success') {
          return const Right("success");
        } else {
          return Left(ServerFailure(data['message']?.toString() ?? "Unknown error"));
        }
      },
    );
  }
}
