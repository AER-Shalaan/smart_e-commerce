import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/address_model/address_response.dart';

abstract class GetAddressDataSource {
  Future<Either<Failure, AddressResponse>> getAddress({
    required String token,
    required String userId,
  });
}