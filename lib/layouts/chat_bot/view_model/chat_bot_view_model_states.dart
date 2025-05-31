import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/chat_bot/chat_message.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';

abstract class ChatBotViewModelStates {}

class ChatBotInitialState extends ChatBotViewModelStates {}

class ChatBotLoadingState extends ChatBotViewModelStates {}

class ChatBotSuccessState extends ChatBotViewModelStates {
  final String reply;
  final List<ProductsData> recommendedItems;
  final List<ChatMessage> messages;

  ChatBotSuccessState(this.reply, this.recommendedItems, this.messages);
}

class ChatBotErrorState extends ChatBotViewModelStates {
  final Failure failure;
  ChatBotErrorState(this.failure);
}
