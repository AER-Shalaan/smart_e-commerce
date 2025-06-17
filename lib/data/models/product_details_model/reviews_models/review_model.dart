class ReviewModel {
  final int reviewId;
  final String buyerName;
  final int rating;
  final String comment;
  final String createdAt;

  ReviewModel({
    required this.reviewId,
    required this.buyerName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json['Review_ID'] ?? 0,
      buyerName: json['Buyer_Name'] ?? '',
      rating: json['Rating'] ?? 0,
      comment: json['Comment'] ?? '',
      createdAt: json['Created_At'] ?? '',
    );
  }
}
