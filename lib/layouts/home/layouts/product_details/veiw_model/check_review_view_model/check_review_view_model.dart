import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/ai_check_data_source/ai_check_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/check_review_view_model/check_review_state.dart';

@injectable
class CheckReviewViewModel extends Cubit<CheckReviewState> {
  AICheckDataSource aiCheckDataSource;
  @factoryMethod
  CheckReviewViewModel(this.aiCheckDataSource) : super(CheckReviewInitial());

  void getAICheckData({required String text}) async {
    emit(CheckReviewLoadingState());
    final result = await aiCheckDataSource.getAICheckData(text: text);
    result.fold(
      (faliure) => emit(CheckReviewErrorState(faliure)),
      (response) => emit(CheckReviewSuccessState(response)),
    );
  }
}
