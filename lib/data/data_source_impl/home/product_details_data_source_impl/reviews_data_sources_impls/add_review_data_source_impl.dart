import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/reviews_data_sources/add_review_data_source.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/add_review_response_model.dart';

@Injectable(as: AddReviewDataSource)
class AddReviewDataSourceImpl extends AddReviewDataSource {
  final ApiManger apiManger;

  @factoryMethod
  AddReviewDataSourceImpl(this.apiManger);
  
  @override
  Future<Either<Failure, AddReviewResponseModel>> addReview({
    required String token,
    required String itemID,
    required String buyerID,
    required int rating,
    required String comment,
  }) async {
    final result = await apiManger.postRequestForHme(
      endPoints: EndPoints.addProductReview,
      token: token,
      queryParameters: {
        "Item_ID": itemID,
        "Buyer_ID": buyerID,
        "Rating": rating,
        "Comment": comment,
      },
    );
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(AddReviewResponseModel.fromJson(response.data)),
    );
  }
}
