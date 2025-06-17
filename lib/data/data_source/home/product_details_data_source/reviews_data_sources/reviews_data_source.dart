import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/reviews_response_model.dart';

abstract class ReviewsDataSource {
  Future<Either<Failure, ReviewsResponseModel>> getReviews({
    required String token,
    required String itemId,
  });
}
