import 'package:smart_ecommerce/data/models/payment_model/payment_response_model.dart';
import 'package:smart_ecommerce/core/api/failure.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final PaymentResponseModel paymentResponse;
  PaymentSuccess(this.paymentResponse);
}

class PaymentFailure extends PaymentState {
  final Failure failure;
  PaymentFailure(this.failure);
}
