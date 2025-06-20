import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/chat_bot_data_source/chat_bot_data_source.dart';
import 'package:smart_ecommerce/data/models/chat_bot/ChatBotResponse.dart';

@Injectable(as: ChatBotDataSource)
class ChatBotDataSourceImpl extends ChatBotDataSource {
  final ApiManger apiManager;

  @factoryMethod
  ChatBotDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failure, ChatBotResponse>> sendMessage({
    required String message,
  }) async {
    final result = await apiManager.sendChatMessage(message);
    return result.map((response) {
      return ChatBotResponse.fromJson(response.data);
    });
  }
}
