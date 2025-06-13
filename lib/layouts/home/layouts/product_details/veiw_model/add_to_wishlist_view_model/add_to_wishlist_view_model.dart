import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/add_and_del_itme_from_wishlsit_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model_states.dart';
@injectable
class AddToWishlistViewModel extends Cubit<AddToWishlistViewModelStates> {
  AddAndDelItmeFromWishlistDataSource addToWishlistDataSource;
  @factoryMethod
  AddToWishlistViewModel(this.addToWishlistDataSource) : super(AddToWishlistInitial());

  Future<void> addToWishlist({
    required String token,
    required String userId,
    required String itemId,
  }) async {
    emit(AddToWishlistLoading());
    final response = await addToWishlistDataSource.addAndDelProduct(
      token: token,
      userId: userId,
      itemId: itemId,
    );
    response.fold(
      (failure) => emit(AddToWishlistFailure(failure)),
      (response) => emit(AddToWishlistSuccess(response))
      );
  }
  
}