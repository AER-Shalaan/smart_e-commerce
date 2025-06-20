import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/add_review_response_model.dart';

abstract class AddReviewStates{}

class AddReviewInitial extends AddReviewStates{}
class AddReviewLoadingState extends AddReviewStates{}
class AddReviewSuccessState extends AddReviewStates{
  AddReviewResponseModel addReviewResponseModel;
  AddReviewSuccessState(this.addReviewResponseModel);
}
class AddReviewErrorState extends AddReviewStates{
  Failure failure;
  AddReviewErrorState(this.failure);
}
