import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  ChatPage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  final _listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages
            .orderBy(kCreatedAt, descending: true)
            .snapshots(), //messages.get() when using Futurebuilder will get all the documents and it fetch the data once but stream is keep lestening for changes
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print(snapshot.data!.docs[0]["message"]);
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  "Scholar chat",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: kprimaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _listViewController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ChatBuble(text: messagesList[index].message)
                            : ChatBubleFromFriend(
                                text: messagesList[index].message);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email
                        });
                        controller.clear();

                        _listViewController.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Send a message",
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kprimaryColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kprimaryColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kprimaryColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
