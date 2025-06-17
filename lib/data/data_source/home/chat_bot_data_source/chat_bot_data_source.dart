import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/chat_bot/ChatBotResponse.dart';

abstract class ChatBotDataSource {
  Future<Either<Failure, ChatBotResponse>> sendMessage({
    required String message,
  });
}