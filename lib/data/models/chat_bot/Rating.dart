class Rating {
  Rating({
      this.averageRating, 
      this.firstReviewDate, 
      this.lastReviewDate, 
      this.totalReviews,});

  Rating.fromJson(dynamic json) {
    averageRating = json['AverageRating'];
    firstReviewDate = json['FirstReviewDate'];
    lastReviewDate = json['LastReviewDate'];
    totalReviews = json['TotalReviews'];
  }
  num? averageRating;
  dynamic firstReviewDate;
  dynamic lastReviewDate;
  num? totalReviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AverageRating'] = averageRating;
    map['FirstReviewDate'] = firstReviewDate;
    map['LastReviewDate'] = lastReviewDate;
    map['TotalReviews'] = totalReviews;
    return map;
  }

}