import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/view_model/add_item_view_states.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/add_item_view_data_source.dart';

@injectable
class AddItemViewViewModel extends Cubit<AddItemViewStates> {
  AddItemViewDataSource addItemViewDataSource;
  @factoryMethod
  AddItemViewViewModel(this.addItemViewDataSource)
    : super(AddItemViewInitialState());

  Future<void> addItemView({
    required String token,
    required int userId,
    required String itemId,
  }) async {
    emit(AddItemViewLoadingState());
    final response = await addItemViewDataSource.addItemView(
      token: token,
      userId: userId,
      itemId: itemId,
    );
    response.fold(
      (failure) => emit(AddItemViewErrorState(failure)),
      (response) => emit(AddItemViewSuccessState(response)),
    );
  }
}
