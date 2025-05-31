import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';

class ChatBotResponse {
  final String reply;
  final List<ProductsData> recommendedItems;

  ChatBotResponse({
    required this.reply,
    required this.recommendedItems,
  });

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotResponse(
      reply: json['reply'] ?? '',
      recommendedItems: (json['recommended_items'] as List<dynamic>?)
              ?.map((e) => ProductsData.fromJson(e))
              .toList() ??
          [],
    );
  }
}
