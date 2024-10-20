import 'dart:convert';

import 'package:flutter_local_llm/modules/chat/model/request/chat_request_model.dart';
import 'package:flutter_local_llm/modules/chat/model/response/chat_response_model.dart';
import 'package:flutter_local_llm/modules/data/APIProvider.dart';
import 'package:flutter_local_llm/modules/data/constants.dart';

class ChatRepo {

  Future<ChatResponseModel> sendChat(ChatRequestModel model) async {
    try {

      final response = await ApiProvider.postRequest(endpoint: sendChatUrl(), jsonBody: model.toJson());
      if (response.statusCode == 200) {
        ChatResponseModel chatResponse = ChatResponseModel.fromJson(jsonDecode(response.body));
        return chatResponse;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

}