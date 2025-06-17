
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/review_model.dart';

abstract class GetReviewsState {}

final class GetReviewsInitial extends GetReviewsState {}

final class GetReviewsLoadingState extends GetReviewsState {}

final class GetReviewsSuccessState extends GetReviewsState {
  final List<ReviewModel> reviews;
   GetReviewsSuccessState(this.reviews);
}

final class GetReviewsErrorState extends GetReviewsState {
  final Failure failure;
  GetReviewsErrorState(this.failure);
}