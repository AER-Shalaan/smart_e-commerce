import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/save_tab_data_source/get_user_wishlist_data_source.dart';
import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_response_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/get_user_wishlist/get_user_wishlist_states.dart';


@injectable
class GetUserWishlistViewModel extends Cubit<GetUserWishlistStates> {
  final GetUserWishlistDataSource getUserWishlistDataSource;

  GetUserWishlistViewModel(this.getUserWishlistDataSource)
      : super(GetUserWishlistInitialState());

  Future<void> getUserWishlist({
    required String userId,
    required String token,
  }) async {
    emit(GetUserWishlistLoadingState());

    final result = await getUserWishlistDataSource.getUserWishlist(
      userId: userId,
      token: token,
    );

    result.fold(
      (Failure failure) {
        emit(GetUserWishlistErrorState(failure));
      },
      (WishlistResponseModel response) {
        emit(GetUserWishlistSuccessState(response.data));
      },
    );
  }
}
