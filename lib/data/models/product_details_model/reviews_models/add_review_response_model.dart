class AddReviewResponseModel {
  final String messageToUser;
  final String message;

  AddReviewResponseModel({required this.messageToUser, required this.message});

  factory AddReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return AddReviewResponseModel(
      messageToUser: json['messageToUser'],
      message: json['message'],
    );
  }
}
