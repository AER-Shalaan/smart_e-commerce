import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_bot_app_bar.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_bot_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    final token = args?['token'];
    final userId = args?['userId'];

    if (token == null || userId == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Missing session data.",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: const ChatBotAppBar(),
      body: ChatBotBody(token: token, userId: userId),
    );
  }
}
