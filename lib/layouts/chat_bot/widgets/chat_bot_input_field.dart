import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/chat_bot/view_model/chat_bot_view_model.dart';

class ChatBotInputField extends StatefulWidget {
  const ChatBotInputField({super.key});

  @override
  State<ChatBotInputField> createState() => _ChatBotInputFieldState();
}

class _ChatBotInputFieldState extends State<ChatBotInputField> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatBotViewModel>().sendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "Type a message.....",
                hintStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                filled: true,
                fillColor: theme.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary.withAlpha(60),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: theme.colorScheme.secondary.withAlpha(102),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, size: 20, color: Colors.white),
              onPressed: _sendMessage,
              splashColor: theme.colorScheme.secondary.withAlpha(60),
              tooltip: "Send",
            ),
          ),
        ],
      ),
    );
  }
}
