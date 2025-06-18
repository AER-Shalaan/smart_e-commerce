import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/del_from_cart_data_source.dart';
import 'del_item_from_cart_view_model_states.dart';
@injectable
class DelItemFromCartViewModel extends Cubit<DelItemFromCartViewModelStates> {
  final DelFromCartDataSource delFromCartDataSource;
  @factoryMethod
  DelItemFromCartViewModel(this.delFromCartDataSource)
      : super(DelItemFromCartInitialState());

  Future<void> removeItemFromCart({
    required String token,
    required String buyerId,
    required String itemId,
  }) async {
    emit(DelItemFromCartLoadingState(itemId));
    final result = await delFromCartDataSource.removeItemFromCart(
      token: token,
      buyerId: buyerId,
      itemId: itemId,
    );
    result.fold(
      (failure) => emit(DelItemFromCartErrorState(errorMessage: failure.message)),
      (cartItems) => emit(DelItemFromCartSuccessState()),
    );
  }
}
