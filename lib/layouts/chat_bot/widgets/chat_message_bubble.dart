import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
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
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: isLoading
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primary
              : isLoading
                  ? Colors.transparent
                  : Colors.grey.shade300,
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
            ? const TypingIndicator(
                flashingCircleBrightColor: AppColors.primary,
                flashingCircleDarkColor: Color(0xFFD3D3D3),
              )
            : Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}
