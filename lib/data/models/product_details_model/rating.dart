class Rating {
  Rating({
    this.averageRating,
    this.totalReviews,
    this.firstReviewDate,
    this.lastReviewDate,
  });

  double? averageRating;
  int? totalReviews;
  String? firstReviewDate;
  String? lastReviewDate;

  Rating.fromJson(dynamic json) {
    if (json['AverageRating'] is num) {
      averageRating = (json['AverageRating'] as num).toDouble();
    } else {
      averageRating = null;
    }

    if (json['TotalReviews'] is int) {
      totalReviews = json['TotalReviews'];
    } else {
      totalReviews = 0;
    }

    firstReviewDate = json['FirstReviewDate'] is String ? json['FirstReviewDate'] : null;
    lastReviewDate = json['LastReviewDate'] is String ? json['LastReviewDate'] : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AverageRating'] = averageRating;
    map['TotalReviews'] = totalReviews;
    map['FirstReviewDate'] = firstReviewDate;
    map['LastReviewDate'] = lastReviewDate;
    return map;
  }
}
