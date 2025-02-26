import 'package:smart_ecommerce/data/models/cart_model/CartModel.dart';

abstract class GetCartViewModelStates {
  
}

class GetCartViewModelInitial extends GetCartViewModelStates {}

class GetCartViewModelLoading extends GetCartViewModelStates {}

class GetCartViewModelError extends GetCartViewModelStates {
  final String message;
  GetCartViewModelError(this.message);
}

class GetCartViewModelSuccess extends GetCartViewModelStates {
  final List<CartModel> cartModel;
  GetCartViewModelSuccess(this.cartModel);
}