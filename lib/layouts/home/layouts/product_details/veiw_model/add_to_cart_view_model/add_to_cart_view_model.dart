import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/cart_tap_data_source/add_to_cart_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model_states.dart';

@injectable
class AddToCartViewModel extends Cubit<AddToCartViewModelStates> {
  AddToCartDataSource addToCartDataSource;
  @factoryMethod
  AddToCartViewModel(this.addToCartDataSource) : super(AddToCartInitial());
  static AddToCartViewModel get(context) => BlocProvider.of(context);
  Future<void> addToCart({
    required String productId,
    required String token,
    required int quantity,
    required String userId,
  }) async {
    emit(AddToCartLoadingState());
    final result = await addToCartDataSource.addToCart(
      productId: productId,
      token: token,
      quantity: quantity,
      userId: userId,
    );
    result.fold(
      (l) => emit(AddToCartSuccessState(l)),
      (r) => emit(AddToCartErrorState(r.toString())),
    );
  }
}
