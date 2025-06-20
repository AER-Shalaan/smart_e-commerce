import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/add_review_response_model.dart';

abstract class AddReviewDataSource {
  Future<Either<Failure, AddReviewResponseModel>> addReview({
    required String token,
    required String itemID,
    required String buyerID,
    required int rating,
    required String comment,
  });
}
