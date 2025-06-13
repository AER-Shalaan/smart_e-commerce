import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/add_and_del_response_for_wishlist.dart';

abstract class AddToWishlistViewModelStates {}

class AddToWishlistInitial extends AddToWishlistViewModelStates {}

class AddToWishlistLoading extends AddToWishlistViewModelStates {}

class AddToWishlistSuccess extends AddToWishlistViewModelStates {
  final AddAndDelResponseForWishlist response;

  AddToWishlistSuccess(this.response);
}

class AddToWishlistFailure extends AddToWishlistViewModelStates {
  final Failure error;

  AddToWishlistFailure(this.error);
}
