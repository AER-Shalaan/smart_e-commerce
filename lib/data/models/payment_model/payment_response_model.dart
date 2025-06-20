class PaymentResponseModel {
  final String token;
  final int orderId;
  final String paymentKey;
  final String paymentUrl;

  PaymentResponseModel({
    required this.token,
    required this.orderId,
    required this.paymentKey,
    required this.paymentUrl,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      token: json['token'] as String,
      orderId: json['orderId'] as int,
      paymentKey: json['paymentKey'] as String,
      paymentUrl: json['paymentUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'orderId': orderId,
      'paymentKey': paymentKey,
      'paymentUrl': paymentUrl,
    };
  }
}
