import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/get_cart_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/view_model/get_cart_view_model/get_cart_view_model_states.dart';

@injectable
class GetCartViewModel extends Cubit<GetCartViewModelStates> {
  GetCartDataSource getCartDataSource;
  @factoryMethod
  GetCartViewModel(this.getCartDataSource) : super(GetCartViewModelInitial());

  Future<void> getCart({required String token, required String userId}) async {
    emit(GetCartViewModelLoading());
    final result = await getCartDataSource.getCart(
      token: token,
      userId: userId,
    );
    result.fold(
      (failure) => emit(GetCartViewModelError(failure.message)),
      (cartList) => emit(GetCartViewModelSuccess(cartList)),
    );
  }
}
