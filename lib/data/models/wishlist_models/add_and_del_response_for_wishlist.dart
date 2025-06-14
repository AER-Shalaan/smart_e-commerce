
class AddAndDelResponseForWishlist {
  final String messageToUser;
  final String message;

  AddAndDelResponseForWishlist({
    required this.messageToUser,
    required this.message,
  });

  factory AddAndDelResponseForWishlist.fromJson(Map<String, dynamic> json) {
    return AddAndDelResponseForWishlist(
      messageToUser: json['messageToUser'],
      message: json['message'],
    );
  }
}
