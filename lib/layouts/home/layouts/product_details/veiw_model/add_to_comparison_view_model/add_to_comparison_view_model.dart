import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/add_to_comparison_data_source.dart';
import 'package:smart_ecommerce/data/models/add_to_comparison_model/add_to_comparison_model.dart';
import 'add_to_comparison_states.dart';

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
    try {
      final response = await dataSource.addItemToComparison(
        token: token,
        itemId: itemId,
        buyerId: buyerId,
      );
      // هنا لو الرسالة warning أو duplicated اعتبرها Error
      if (response.message == "warning" || response.message == "duplicated") {
        emit(AddToComparisonError(response));
      } else {
        emit(AddToComparisonSuccess(response));
      }
    } catch (e) {
      emit(
        AddToComparisonError(
          AddToComparisonModel(
            message: 'error',
            messageToUser: e.toString(),
          ),
        ),
      );
    }
  }
}
