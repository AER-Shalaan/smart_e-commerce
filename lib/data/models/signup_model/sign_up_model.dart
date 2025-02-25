class SignUpModel {
  SignUpModel({
    this.message,
    this.token,
  });

  SignUpModel.fromJson(dynamic json) {
    message = json['message'];
    token = json['Token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['Token'] = token;
    return map;
  }
}
