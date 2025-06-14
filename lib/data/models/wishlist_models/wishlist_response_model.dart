import 'package:smart_ecommerce/data/models/wishlist_models/wishlist_item_model.dart';

class WishlistResponseModel {
  final String message;
  final List<WishlistItemModel> data;

  WishlistResponseModel({
    required this.message,
    required this.data,
  });

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    return WishlistResponseModel(
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((item) => WishlistItemModel.fromJson(item))
          .toList(),
    );
  }
}
