import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/chat_bot_data_source/chat_bot_data_source.dart';
import 'package:smart_ecommerce/data/models/chat_bot/chat_message.dart';

import 'chat_bot_view_model_states.dart';

@injectable
class ChatBotViewModel extends Cubit<ChatBotViewModelStates> {
  final ChatBotDataSource chatBotDataSource;

  ChatBotViewModel(this.chatBotDataSource) : super(ChatBotInitialState());

  final List<ChatMessage> messages = [];

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    messages.add(ChatMessage(message: message, isUser: true));
    emit(ChatBotLoadingState());

    final result = await chatBotDataSource.sendMessage(message: message);

    result.fold(
      (failure) {
        debugPrint("ChatBot Error: ${failure.message}");
        emit(ChatBotErrorState(failure));
      },
      (response) {
        messages.add(ChatMessage(message: response.reply ?? "", isUser: false));
        emit(
          ChatBotSuccessState(
            response.reply ?? "",
            response.products ?? [],
            List.from(messages),
          ),
        );
      },
    );
  }

  Future<void> initializeChat() async {
    resetConversation();
  }

  void resetConversation() {
    messages.clear();

    messages.add(
      ChatMessage(
        message:
            "Welcome! I'm here to help you with your shopping. Feel free to ask me anything!",
        isUser: false,
      ),
    );

    emit(ChatBotSuccessState("", [], List.from(messages)));
  }
}
