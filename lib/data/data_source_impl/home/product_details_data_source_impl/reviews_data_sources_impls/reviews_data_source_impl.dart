import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/reviews_data_sources/reviews_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/reviews_response_model.dart';

@Injectable(as: ReviewsDataSource)
class ReviewsDataSourceImpl extends ReviewsDataSource {
  final ApiManger apiManger;

  @factoryMethod
  ReviewsDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, ReviewsResponseModel>> getReviews({
    required String token,
    required String itemId,
  }) async {
    final result = await apiManger.getRequest(
      endPoints: EndPoints.getProductReviews,
      token: token,
      queryParameters: {"Item_ID": itemId},
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(ReviewsResponseModel.fromJson(response.data)),
    );
  }
}
