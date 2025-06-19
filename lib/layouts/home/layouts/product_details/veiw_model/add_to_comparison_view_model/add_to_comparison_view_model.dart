import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/add_to_comparison_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_comparison_view_model/add_to_comparison_states.dart';
@injectable
class AddToComparisonViewModel extends Cubit<AddToComparisonStates> {
  final AddToComparisonDataSource dataSource;
  @factoryMethod
  AddToComparisonViewModel(this.dataSource) : super(AddToComparisonInitial());

  Future<void> addItem({
    required String token,
    required String itemId,
    required String buyerId,
  }) async {
    emit(AddToComparisonLoading());
    final result = await dataSource.addItemToComparison(
      token: token,
      itemId: itemId,
      buyerId: buyerId,
    );
    result.fold(
      (failure) => emit(AddToComparisonError(failure.message)),
      (msg) => emit(AddToComparisonSuccess(msg)),
    );
  }
}