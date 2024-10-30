import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, this.isMe = true});
  final Message message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe == true ? Alignment.centerLeft : Alignment.centerRight,
      child: Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.only(left: 20, top: 10, right: 20),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          decoration: BoxDecoration(
              color: isMe == true ? kPrimaryColor : Color(0xff35667B),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight:
                      isMe == true ? Radius.circular(32) : Radius.circular(0),
                  bottomLeft:
                      isMe == true ? Radius.circular(0) : Radius.circular(32))),
          child: Text(
            message.message,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
