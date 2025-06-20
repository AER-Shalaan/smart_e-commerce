import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/typing_indicator.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isLoading;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // ألوان الفقاعات حسب الثيم
    final Color userBubble = theme.colorScheme.primary;
    final Color assistantBubble = theme.brightness == Brightness.dark
        ? theme.colorScheme.surfaceContainerHighest.withAlpha(180)
        : Colors.grey.shade200;

    final Color userTextColor = theme.colorScheme.onPrimary;
    final Color assistantTextColor = theme.colorScheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser
              ? userBubble
              : isLoading
                  ? Colors.transparent
                  : assistantBubble,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isUser ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isUser ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: isLoading
            ? TypingIndicator(
                brightColor: theme.colorScheme.primary,
                darkColor: theme.disabledColor,
              )
            : Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isUser ? userTextColor : assistantTextColor,
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}
