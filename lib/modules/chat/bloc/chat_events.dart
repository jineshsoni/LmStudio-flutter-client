abstract class ChatEvents {}

class SendChat extends ChatEvents {
  final String text;

  SendChat(this.text);

}