import 'package:flutter/material.dart';
import 'package:flutter_local_llm/modules/chat/model/chat.dart';
import 'package:flutter_local_llm/modules/chat/view/widgets/chat_ui.dart';

class ChatList extends StatelessWidget {

  final ScrollController scrollController;
  const ChatList({super.key, required this.chatItems, required this.scrollController});

  final List<Chat>? chatItems;

  @override
  Widget build(BuildContext context) {
    return chatItems != null ? ListView.builder(
      itemCount: chatItems?.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
      return ChatBubble(chat: chatItems![index]);
    },) : const Center(
      child: Text("Start Chatting", style: TextStyle(color: Colors.white),),
    );
  }


}
