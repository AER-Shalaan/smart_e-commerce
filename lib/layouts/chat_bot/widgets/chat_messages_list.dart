import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/chat_bot/chat_message.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_message_bubble.dart';

class ChatMessagesList extends StatelessWidget {
  final List<ChatMessage> messages;
  final bool showTyping;
  final ScrollController? controller;

  const ChatMessagesList({
    super.key,
    required this.messages,
    this.showTyping = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final fullMessages = List<ChatMessage>.from(messages);

    if (showTyping) {
      fullMessages.add(ChatMessage(message: "", isUser: false));
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fullMessages.length,
      itemBuilder: (context, index) {
        final msg = fullMessages[index];
        return ChatMessageBubble(
          message: msg.message,
          isUser: msg.isUser,
          isLoading:
              showTyping &&
              index == fullMessages.length - 1 &&
              !msg.isUser &&
              msg.message.isEmpty,
        );
      },
    );
  }
}
