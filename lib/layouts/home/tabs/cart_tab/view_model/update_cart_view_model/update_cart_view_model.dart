import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/update_cart_data_source.dart';
import 'update_cart_view_model_states.dart';

@injectable
class UpdateCartViewModel extends Cubit<UpdateCartViewModelStates> {
  final UpdateCartDataSource updateCartDataSource;
  @factoryMethod
  UpdateCartViewModel(this.updateCartDataSource)
    : super(UpdateCartInitialState());

  Future<void> updateCartItem({
    required String token,
    required String buyerId,
    required String itemId,
    required int quantity,
  }) async {
    emit(UpdateCartLoadingState(itemId));
    final result = await updateCartDataSource.updateCartItem(
      token: token,
      buyerId: buyerId,
      itemId: itemId,
      quantity: quantity,
    );
    result.fold(
      (failure) => emit(UpdateCartErrorState(errorMessage: failure.message)),
      (cartItems) => emit(UpdateCartSuccessState(cartItems: cartItems)),
    );
  }
}
