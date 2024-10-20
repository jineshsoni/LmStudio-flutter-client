import 'package:flutter_local_llm/modules/chat/model/chat.dart';

class ChatRequestModel {

  ChatRequestModel({
      String? model, 
      List<Messages>? messages, 
      double? temperature, 
      int? maxTokens, 
      bool? stream,}){
    _model = model;
    _messages = messages;
    _temperature = temperature;
    _maxTokens = maxTokens;
    _stream = stream;
}

  ChatRequestModel.fromJson(dynamic json) {
    _model = json['model'];
    if (json['messages'] != null) {
      _messages = [];
      json['messages'].forEach((v) {
        _messages?.add(Messages.fromJson(v));
      });
    }
    _temperature = json['temperature'];
    _maxTokens = json['max_tokens'];
    _stream = json['stream'];
  }
  String? _model;
  List<Messages>? _messages;
  double? _temperature;
  int? _maxTokens;
  bool? _stream;

  String? get model => _model;
  List<Messages>? get messages => _messages;
  double? get temperature => _temperature;
  int? get maxTokens => _maxTokens;
  bool? get stream => _stream;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model'] = _model;
    if (_messages != null) {
      map['messages'] = _messages?.map((v) => v.toJson()).toList();
    }
    map['temperature'] = _temperature;
    map['max_tokens'] = _maxTokens;
    map['stream'] = _stream;
    return map;
  }

  static ChatRequestModel createRequest({required String text, List<Chat>? oldChat}) {
    List<Messages> messages = [];

    if(oldChat != null) {
      for (var element in oldChat) {
        messages.add(Messages(
            content: element.text,
            role: element.isUser ? "user" : "system"
        ));
      }
    }

    messages.add(
        Messages(
          content: "Give Best Possible Answers",
          role: "system"
        )
    );
    messages.add(
        Messages(
          content: text,
          role: "user"
        )
    );



    return ChatRequestModel(
      model: "TheBloke/phi-2-GGUF",
      temperature: 0.7, maxTokens: -1,
        messages: messages, stream: false);
  }

}

class Messages {
  Messages({
      String? role, 
      String? content,}){
    _role = role;
    _content = content;
}

  Messages.fromJson(dynamic json) {
    _role = json['role'];
    _content = json['content'];
  }
  String? _role;
  String? _content;

  String? get role => _role;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['content'] = _content;
    return map;
  }

}