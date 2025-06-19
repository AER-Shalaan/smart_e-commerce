import 'package:smart_ecommerce/data/models/address_model/address.dart';

class AddressResponse {
  final String message;
  final List<Address> data;

  AddressResponse({
    required this.message,
    required this.data,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => Address.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
