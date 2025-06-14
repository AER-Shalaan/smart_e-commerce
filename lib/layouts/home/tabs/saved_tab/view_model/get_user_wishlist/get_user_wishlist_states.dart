import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_item_model.dart';

abstract class GetUserWishlistStates  {}

class GetUserWishlistInitialState extends GetUserWishlistStates {}

class GetUserWishlistLoadingState extends GetUserWishlistStates {}

class GetUserWishlistSuccessState extends GetUserWishlistStates {
  final List<WishlistItemModel> wishlist;

  GetUserWishlistSuccessState(this.wishlist);

}

class GetUserWishlistErrorState extends GetUserWishlistStates {
  final Failure message;

  GetUserWishlistErrorState(this.message);
}
