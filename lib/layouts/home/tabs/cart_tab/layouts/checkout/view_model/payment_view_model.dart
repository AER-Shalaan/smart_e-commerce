import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/payment_data_source/payment_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/view_model/payment_state.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentState> {
  final PaymentDataSource paymentDataSource;
  @factoryMethod
  PaymentViewModel({required this.paymentDataSource}) : super(PaymentInitial());

  Future<void> startPayment({
    required int integrationId,
    required int userId,
    required int addressId,
    required String token,
  }) async {
    emit(PaymentLoading());

    final result = await paymentDataSource.startPayment(
      integrationId: integrationId,
      userId: userId,
      addressId: addressId,
      token: token,
    );

    result.fold(
      (failure) => emit(PaymentFailure(failure)),
      (paymentResponse) => emit(PaymentSuccess(paymentResponse)),
    );
  }

  void reset() => emit(PaymentInitial());
}
