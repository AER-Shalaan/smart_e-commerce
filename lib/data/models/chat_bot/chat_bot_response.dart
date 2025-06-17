import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class ChatBotResponse {
  final String reply;
  final List<ProductDetailsModel> recommendedItems;

  ChatBotResponse({
    required this.reply,
    required this.recommendedItems,
  });

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotResponse(
      reply: json['reply'] ?? '',
      recommendedItems: (json['recommended_items'] as List<dynamic>?)
              ?.map((e) => ProductDetailsModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
