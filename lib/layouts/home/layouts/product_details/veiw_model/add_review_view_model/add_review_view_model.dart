import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/reviews_data_sources/add_review_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_review_view_model/add_review_states.dart';

@injectable
class AddReviewViewModel extends Cubit<AddReviewStates> {
  AddReviewDataSource addReviewDataSource;
  @factoryMethod
  AddReviewViewModel(this.addReviewDataSource) : super(AddReviewInitial());

  void addReview({
    required String token,
    required String itemID,
    required String buyerID,
    required int rating,
    required String comment,
  }) async {
    emit(AddReviewLoadingState());
    final result = await addReviewDataSource.addReview(
      token: token,
      itemID: itemID,
      buyerID: buyerID,
      rating: rating,
      comment: comment,
    );
    result.fold(
      (failure) => emit(AddReviewErrorState(failure)),
      (response) => emit(AddReviewSuccessState(response)),
    );
  }
}
