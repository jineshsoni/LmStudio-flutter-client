import 'package:flutter_local_llm/modules/chat/bloc/chat_events.dart';
import 'package:flutter_local_llm/modules/chat/bloc/chat_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_local_llm/modules/chat/model/chat.dart';
import 'package:flutter_local_llm/modules/chat/model/request/chat_request_model.dart';
import 'package:flutter_local_llm/modules/chat/model/response/chat_response_model.dart';
import 'package:flutter_local_llm/modules/chat/repo/chat_repo.dart';

class ChatBloc extends Bloc<ChatEvents, ChatState> {

  ChatRepo repo = ChatRepo();

  ChatBloc() : super(ChatState()) {


    on<SendChat>(
      (event, emit) async {
        List<Chat> list = state.chatList ?? [];
        list.add(Chat(text: event.text, isUser: true));

        emit(ChatState(chatList: list, loading: true));
        ChatResponseModel resp = await repo.sendChat(ChatRequestModel.createRequest(text: event.text, oldChat: state.chatList));
        Message? message = resp.choices?.first.message;

        if(message != null){
          list.add(Chat(text: message.content!, isUser: false));
        }
        emit(ChatState(chatList: list, loading: false));
      },
    );
  }

}