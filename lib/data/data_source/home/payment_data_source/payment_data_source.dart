
import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/payment_model/payment_response_model.dart';

abstract class PaymentDataSource {
  Future<Either<Failure, PaymentResponseModel>> startPayment({
    required int integrationId,
    required int userId,
    required int addressId,
    required String token,
  });
}
