import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/review_model.dart';

class ReviewsResponseModel {
  final String message;
  final List<ReviewModel> data;

  ReviewsResponseModel({
    required this.message,
    required this.data,
  });

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewsResponseModel(
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
