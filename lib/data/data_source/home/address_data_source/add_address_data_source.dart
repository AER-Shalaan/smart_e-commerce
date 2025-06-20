import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/address_model/add_address_model/add_address_request_model.dart';

abstract class AddAddressDataSource {
  Future<Either<Failure, String>> addAddress({
    required String token,
    required String userId,
    required AddAddressRequestModel address,
  });
}