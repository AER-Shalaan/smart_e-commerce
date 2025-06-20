import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/payment_data_source/payment_data_source.dart';
import 'package:smart_ecommerce/data/models/payment_model/payment_response_model.dart';

@Injectable(as: PaymentDataSource)
class PaymentDataSourceImpl implements PaymentDataSource {
  final ApiManger apiManger;
  @factoryMethod
  PaymentDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, PaymentResponseModel>> startPayment({
    required int integrationId,
    required int userId,
    required int addressId,
    required String token,
  }) async {
    final result = await apiManger.postRequestForHme(
      endPoints: EndPoints.paymentMethodsEndPoint,
      token: token,
      queryParameters: {
        "integrationId": integrationId,
        "userId": userId,
        "addressID": addressId,
      },
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(PaymentResponseModel.fromJson(response.data)),
    );
  }
}
