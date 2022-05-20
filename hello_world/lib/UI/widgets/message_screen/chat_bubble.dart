import 'package:flutter/material.dart';
import 'package:hello_world/UI/widgets/message_screen/message_body.dart';

class ChatMessage {
  String message;
  MessageType type;
  ChatMessage({required this.message, required this.type});
}

class ChatBubble extends StatefulWidget {
  final ChatMessage chatMessage;

  const ChatBubble(this.chatMessage);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
          mainAxisAlignment: widget.chatMessage.type == MessageType.Receiver
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7),
                              decoration: (widget.chatMessage.type ==
                                      MessageType.Receiver
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: Colors.grey[50],
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      color: Colors.grey[50],
                                    )),
                              child: Text(
                                widget.chatMessage.message.trim(),
                                softWrap: true,
                              ),
                            ),
                            Text(
                              "12:49 AM",
                              style: TextStyle(fontSize: 9),
                            )
                          ]),
                    ],
                  ),
                  if (widget.chatMessage.type == MessageType.Sender)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            color: Colors.grey[200], shape: BoxShape.circle),
                        child: Icon(
                          Icons.done_all,
                          size: 12,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ]),
    );
  }
}
