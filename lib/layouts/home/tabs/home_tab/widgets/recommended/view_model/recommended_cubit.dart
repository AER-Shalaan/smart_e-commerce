import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/recommended_list_data_souce.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/recommended/view_model/recommended_state.dart';

@injectable
class RecommendedProductsCubit extends Cubit<RecommendedState> {
  @factoryMethod
  RecommendedProductsCubit(this.recommendedListDataSource)
    : super(RecommendedInitial());

  RecommendedListDataSource recommendedListDataSource;

  Future<void> getRecommendedList({required int userId}) async {
    emit(RecommendedLoading());
    final result = await recommendedListDataSource.getRecommendedList(
      userId: userId,
    );
    result.fold((l) => emit(RecommendedError(l)), (r) {
      if (isClosed) return;
      emit(RecommendedLoaded(r));
    });
  }
}
