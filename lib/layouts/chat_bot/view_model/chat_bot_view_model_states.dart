import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/chat_bot/chat_message.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

abstract class ChatBotViewModelStates {}

class ChatBotInitialState extends ChatBotViewModelStates {}

class ChatBotLoadingState extends ChatBotViewModelStates {}

class ChatBotSuccessState extends ChatBotViewModelStates {
  final String reply;
  final List<ProductDetailsModel> recommendedItems;
  final List<ChatMessage> messages;

  ChatBotSuccessState(this.reply, this.recommendedItems, this.messages);
}

class ChatBotErrorState extends ChatBotViewModelStates {
  final Failure failure;
  ChatBotErrorState(this.failure);
}
