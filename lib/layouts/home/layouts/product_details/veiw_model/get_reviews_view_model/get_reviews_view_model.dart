import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/reviews_data_sources/reviews_data_source.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_state.dart';

@injectable
class GetReviewsViewModel extends Cubit<GetReviewsState> {
  ReviewsDataSource reviewsDataSource;
  @factoryMethod
  GetReviewsViewModel(this.reviewsDataSource) : super(GetReviewsInitial());

  Future<void> getReviews({
    required String token,
    required String itemId,
  }) async {
    emit(GetReviewsLoadingState());
    final result = await reviewsDataSource.getReviews(
      token: token,
      itemId: itemId,
    );
    result.fold(
      (failure) => emit(GetReviewsErrorState(failure)),
      (response) => emit(GetReviewsSuccessState(response.data)),
    );
  }
}