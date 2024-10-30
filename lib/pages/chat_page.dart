import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);
  bool isLoading = true;
  TextEditingController controller = TextEditingController();
  ScrollController scrollcontroller = ScrollController();
  String email = "";
  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        List<Message> messageList = [];
        if (snapshot.hasData) {
          isLoading = false;
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fomJson(snapshot.data!.docs[i]));
          }
          // print(snapshot.data!.docs[1]['message']);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogoPath,
                    width: 50,
                    height: 50,
                  ),
                  const Text("chat "),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollcontroller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                          message: messageList[index],
                          isMe: messageList[index].id == email);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: sendMessage,
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.only(
                          left: 16, right: 32, top: 16, bottom: 16),
                      suffix: Container(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          onPressed: () {
                            sendMessage(controller.text);
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          //padding: EdgeInsets.all(1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: const Scaffold(
                body: Text('Loading ..'),
              ));
        }
      },
    );
  }

  void sendMessage(data) async {
    print(FieldValue.serverTimestamp());
    await messages.add({
      kMessageFiled: data,
      kCreatedAt: FieldValue.serverTimestamp(),
      kId: email
    });

    controller.clear();
    scrollcontroller.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }
}
