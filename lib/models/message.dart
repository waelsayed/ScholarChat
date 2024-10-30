import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/constants.dart';

class Message {
  final String message;
  final String id;
  final dynamic date;
  Message({required this.message, required this.id, required this.date});
  factory Message.fomJson(jsonData) {
    return Message(
        message: jsonData[kMessageFiled],
        id: jsonData[kId],
        date: jsonData[kCreatedAt]);
  }
}
