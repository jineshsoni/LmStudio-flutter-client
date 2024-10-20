import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function sendChat;

  const ChatInput({super.key, required this.sendChat});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type here",
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                  controller: textController,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.small(
                backgroundColor: Colors.white,
                child: const Icon(Icons.send, color: Colors.black,),
                  onPressed: () {
                    sendChat(textController.text);
              }),
            )
          ],
        ),
      ),
    );
  }
}
