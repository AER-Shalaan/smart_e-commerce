import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/chat_bot/view_model/chat_bot_view_model.dart';
import 'package:smart_ecommerce/layouts/chat_bot/view_model/chat_bot_view_model_states.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_bot_input_field.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_bot_product_list_builder.dart';
import 'package:smart_ecommerce/layouts/chat_bot/widgets/chat_message_bubble.dart';

class ChatBotBody extends StatefulWidget {
  final String token;
  final String userId;

  const ChatBotBody({super.key, required this.token, required this.userId});

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {
  late final ChatBotViewModel chatBotViewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatBotViewModel = context.read<ChatBotViewModel>();
    chatBotViewModel.resetConversation();
  }

  void _autoScrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<ChatBotViewModel, ChatBotViewModelStates>(
      listener: (context, state) {
        if (state is ChatBotSuccessState || state is ChatBotLoadingState) {
          _autoScrollToBottom();
        }
      },
      builder: (context, state) {
        final messages =
            (state is ChatBotSuccessState)
                ? state.messages
                : chatBotViewModel.messages;

        final List<ProductDetailsModel> recommendedItems =
            (state is ChatBotSuccessState) ? state.recommendedItems : [];

        final isTyping = state is ChatBotLoadingState;

        return SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      chatBotViewModel.resetConversation();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: CustomScrollView(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            sliver:
                                messages.isEmpty
                                    ? SliverToBoxAdapter(
                                      child: Center(
                                        child: Text(
                                          "Start chatting with our Shopping Assistant!",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    )
                                    : SliverList(
                                      delegate: SliverChildBuilderDelegate((
                                        context,
                                        index,
                                      ) {
                                        return ChatMessageBubble(
                                          message: messages[index].message,
                                          isUser: messages[index].isUser,
                                        );
                                      }, childCount: messages.length),
                                    ),
                          ),
                          if (isTyping)
                            const SliverToBoxAdapter(
                              child: ChatMessageBubble(
                                message: "",
                                isUser: false,
                                isLoading: true,
                              ),
                            ),
                          if (recommendedItems.isNotEmpty)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: ChatBotProductListBuilder(
                                  products: recommendedItems,
                                  label: "Recommended Products",
                                  token: widget.token,
                                  userId: widget.userId,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: bottomInset,
                child: const ChatBotInputField(),
              ),
            ],
          ),
        );
      },
    );
  }
}
