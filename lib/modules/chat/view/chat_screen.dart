import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_llm/helper/app_logs.dart';
import 'package:flutter_local_llm/modules/chat/bloc/chat_bloc.dart';
import 'package:flutter_local_llm/modules/chat/bloc/chat_events.dart';
import 'package:flutter_local_llm/modules/chat/bloc/chat_state.dart';
import 'package:flutter_local_llm/modules/chat/view/widgets/chat_input.dart';
import 'package:flutter_local_llm/modules/chat/view/widgets/chat_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if(_scrollController.positions.isNotEmpty) {
              Logs.p("Trying to scroll down now");
              _scrollDown();
            }
            return Column(
              children: [
                Flexible(flex: 1,
                    child: ChatList(chatItems: state.chatList, scrollController: _scrollController,)
                ),
                state.loading ? const CircularProgressIndicator() : const SizedBox(),
                ChatInput(
                  sendChat: (value) {
                    chatBloc.add(SendChat(value));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
