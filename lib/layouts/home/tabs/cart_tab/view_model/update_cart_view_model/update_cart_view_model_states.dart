import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

abstract class UpdateCartViewModelStates {}

class UpdateCartInitialState extends UpdateCartViewModelStates {}

class UpdateCartLoadingState extends UpdateCartViewModelStates {
  final String updatingItemId;
  UpdateCartLoadingState(this.updatingItemId);
}

class UpdateCartSuccessState extends UpdateCartViewModelStates {
  final List<CartModel> cartItems;
  UpdateCartSuccessState({required this.cartItems});
}

class UpdateCartErrorState extends UpdateCartViewModelStates {
  final String errorMessage;
  UpdateCartErrorState({required this.errorMessage});
}
