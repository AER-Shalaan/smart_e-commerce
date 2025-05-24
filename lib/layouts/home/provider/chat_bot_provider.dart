import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/widgets/chat_bot.dart';

class ChatBotProvider extends ChangeNotifier {
  bool isChatbotVisible = false;

  void changeChatbotVisibility({
    required bool newValue,
    required BuildContext context,
  }) {
    if (isChatbotVisible == newValue) return;
    isChatbotVisible = newValue;
    if (isChatbotVisible) {
      ChatBot.show(context);
    } else {
      ChatBot.hide();
    }

    notifyListeners();
  }

  void hideChatBot({BuildContext? context}) {
    if (!isChatbotVisible) return;
    isChatbotVisible = false;
    ChatBot.hide();
    notifyListeners();
  }
}
