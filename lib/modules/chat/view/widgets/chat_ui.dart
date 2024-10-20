import 'package:flutter/material.dart';
import 'package:flutter_local_llm/modules/chat/model/chat.dart';

class ChatBubble extends StatelessWidget {
  final Chat chat;

  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chat.isUser ?  CrossAxisAlignment.end: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8,),
        Icon(chat.isUser ? Icons.account_circle_rounded: Icons.rocket_launch, color: Colors.white,),
        Card(
          elevation: 2.0,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(chat.text),
          ),
        ),
      ],
    );
  }
}
