import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/add_and_del_response_for_wishlist.dart';

abstract class DelItemFromWishlistStates {}

class DelItemFromWishlistInitialState extends DelItemFromWishlistStates {}

class DelItemFromWishlistLoadingState extends DelItemFromWishlistStates {}

class DelItemFromWishlistSuccessState extends DelItemFromWishlistStates {
  final AddAndDelResponseForWishlist response;

 DelItemFromWishlistSuccessState(this.response);
}

class DelItemFromWishlistErrorState extends DelItemFromWishlistStates {
  final Failure error;

  DelItemFromWishlistErrorState(this.error);
}
