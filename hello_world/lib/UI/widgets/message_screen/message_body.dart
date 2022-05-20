import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_world/UI/widgets/message_screen/chat_bubble.dart';

enum MessageType {
  Sender,
  Receiver,
}

// ignore: must_be_immutable
class MessageBody extends StatelessWidget {
  MessageBody();

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> chatMessage = [
      ChatMessage(message: 'Hi', type: MessageType.Sender),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi', type: MessageType.Sender),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi', type: MessageType.Sender),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
      ChatMessage(message: 'Hi back', type: MessageType.Receiver),
    ];

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: chatMessage.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    ChatBubble(chatMessage[index]))),
       
      ],
    );
  }
}
