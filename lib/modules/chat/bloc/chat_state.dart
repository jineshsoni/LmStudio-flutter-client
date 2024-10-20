import 'package:flutter_local_llm/modules/chat/model/chat.dart';

class ChatState {
  final List<Chat>? chatList;
  final bool loading;

  ChatState({this.chatList, this.loading = false});

  // ChatState copyWith({
  //   final List<Chat>? chatList,
  //   final bool? loading;
  // }) {
  //   return ChatState(chatList: chatList ?? this.chatList, loading: loading ?? this.loading, );
  // }
}