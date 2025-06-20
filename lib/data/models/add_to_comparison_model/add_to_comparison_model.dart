class AddToComparisonModel {
  final String message;
  final String messageToUser;

  AddToComparisonModel({
    required this.message,
    required this.messageToUser,
  });

  factory AddToComparisonModel.fromJson(Map<String, dynamic> json) {
    return AddToComparisonModel(
      message: json['message'] ?? '',
      messageToUser: json['messageToUser'] ?? '',
    );
  }
}