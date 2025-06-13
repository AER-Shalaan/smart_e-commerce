import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_item_model.dart';

class WishlistProvider extends ChangeNotifier {
  

List<WishlistItemModel> wishlist = [];

  void removefromWishlist(WishlistItemModel wishlistItemModel) {
    wishlist.remove(wishlistItemModel);
    notifyListeners();
  }
}