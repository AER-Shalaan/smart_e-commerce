import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/del_itme_from_wishlsit_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/del_Item_from_wishlist/del_item_from_wishlist_states.dart';

@injectable
class DelItemFormWishlistViewModel extends Cubit<DelItemFromWishlistStates> {
  DelItmeFromWishlsitDataSource delToWishlistDataSource;
  @factoryMethod
  DelItemFormWishlistViewModel(this.delToWishlistDataSource)
    : super(DelItemFromWishlistInitialState());

  Future<void> delItemFromWishlist({
    required String token,
    required String userId,
    required String itemId,
  }) async {
    emit(DelItemFromWishlistLoadingState());
    final response = await delToWishlistDataSource.delProduct(
      token: token,
      userId: userId,
      itemId: itemId,
    );
    response.fold(
      (failure) => emit(DelItemFromWishlistErrorState(failure)),
      (response) => emit(DelItemFromWishlistSuccessState(response)),
    );
  }
}
